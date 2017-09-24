<?php

namespace backend\controllers;

use Yii;
use common\models\Event;
use common\models\EventTeam;
use common\models\EventRound;
use common\models\EventTeamRound;
use common\models\EventRoundMatch;
use common\models\TeamEvent;
use backend\models\EventSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\db\Exception;
use yii\filters\VerbFilter;

/**
 * EventController implements the CRUD actions for Event model.
 */
class EventController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Event models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new EventSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Event model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Event model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Event();

        if ($model->load(Yii::$app->request->post())) {

            $model->occasion_id = $model->occasion_dd;
            $model->location_venue_id = Yii::$app->db->
                createCommand('SELECT id FROM location_venue WHERE location_id =' . $model->location_dd . ' and venue_id =' . $model->venue_dd)
            ->queryScalar();
            $model->event_type_id = $model->event_type_dd;
            $model->event_category_id = $model->event_category_dd;
            $model->match_system_id = $model->match_system_dd;
            $model->sort_order_id =  Yii::$app->db->
                createCommand('SELECT id FROM sort_order WHERE sort_id =' . $model->sort_dd . ' and order_id =' . $model->order_dd)
            ->queryScalar();
            $model->event_status_id = 1;
            $model->min_team = 2;
            $model->max_team = 12;
            // $model->champ = 2;
            // $model->first = 2;
            // $model->second = 2;
            // $model->date_start = 2017-09-11;
            // $model->date_end = 2017-09-11;

            $model->save();
            Yii::$app->session->setFlash('success','Successfully Create Event');
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Event model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model->occasion_dd = $model->occasion_id;
        $model->location_dd = $model->locationVenue->location_id;
        $model->venue_dd = $model->locationVenue->venue_id;
        $model->event_type_dd = $model->event_type_id;
        // $eventStatus->id = $model->event_status_id;
        $model->event_category_dd = $model->event_category_id;
        $model->match_system_dd = $model->match_system_id;
        $model->sort_dd = $model->sortOrder->sort_id;
        $model->order_dd = $model->sortOrder->order_id;

        if ($model->load(Yii::$app->request->post())) {
            $model->occasion_id = $model->occasion_dd;
            $model->location_venue_id = Yii::$app->db->
                createCommand('SELECT id FROM location_venue WHERE location_id =' . $model->location_dd . ' and venue_id =' . $model->venue_dd)
            ->queryScalar();
            $model->event_type_id =  $model->event_type_dd;
            $model->event_category_id = $model->event_category_dd;
            // $model->event_status_id = $eventStatus->id;
            $model->match_system_id = $model->match_system_dd;
            $model->sort_order_id = Yii::$app->db->
                createCommand('SELECT id FROM sort_order WHERE sort_id =' . $model->sort_dd . ' and order_id =' . $model->order_dd)
            ->queryScalar();

            $model->save();
                Yii::$app->session->setFlash('success','Successfully Updated the Event');
                return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Event model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        Yii::$app->session->setFlash('success','Successfully Deleted the Event');
        return $this->redirect(['index']);
    }

    public function actionFinalize($id) {
        $model = $this->findModel($id);
        $numOfTeams = count($model->eventTeams);
        if ($numOfTeams >= $model->min_team) {
            $system = $model->matchSystem->system;
            $var = "even";
            switch($system) {
                case "Single Elimination":
                    break;
                case "Double Elimination":
                    break;
                case "Round Robin":
                    if ($system === "Round Robin") {
                        // if number of teams is not even, add Bye
                        $bye = 0;
                        if ($numOfTeams % 2 === 1) {
                            $numOfTeams++;
                            $eventTeam = new EventTeam();
                            $eventTeam->event_id = $id;
                            $eventTeam->team_event_id = Yii::$app->db->
                                createCommand('SELECT id FROM team_event WHERE team_id =' . 0 . ' and event_type_id =' . $model->event_type_id)
                            ->queryScalar();
                            $eventTeam->event_team_status_id = 2;
                            $eventTeam->team_order = $numOfTeams;
                            // $eventTeam->total_wins = 0;
                            // $eventTeam->total_draws = 0;
                            // $eventTeam->total_loss = 0;
                            $eventTeam->save(false);
                            $bye++;
                        }
                        //check if there is a Bye
                        if ($bye == 0)  {
                            $eventTeam = new EventTeam();
                            $eventTeam = $model->eventTeams[0];

                            $teamEvent = TeamEvent::find()->where(['id' => $eventTeam->team_event_id])->one();
                            if ($teamEvent->team_id == '0') {
                                $bye++;
                            }
                        }
                        //
                        // // assign seed number (team_order);
                        $seed = range(1,$numOfTeams-$bye);
                        shuffle($seed);
                        for ($ctr = 0 + $bye; $ctr < $numOfTeams; $ctr++) {
                            $eventTeam = new EventTeam();
                            $eventTeam = $model->eventTeams[$ctr];
                            // if ($eventTeam->teamEvent->team_id != 0) {
                                $eventTeam->team_order = array_pop($seed);
                            // }
                            $eventTeam->save(false);
                        }
                        //
                        // create rounds based on number of teams (num of teams - 1)
                        // for ($ctr = 1; $ctr < $numOfTeams; $ctr++) {
                        //     try {
                        //         $eventRound = new EventRound();
                        //         $eventRound->event_id = $id;
                        //         $eventRound->round = $ctr;
                        //         $eventRound->round_status_id = 1;
                        //         // $eventRound->date_start = '0000-00-00';
                        //         $eventRound->save(false);
                        //     } catch (Exception $e) {
                        //         throw new Exception("Duplicate Entry");
                        //     }
                        //
                        // }
                        //
                        // // create event team rounds
                            // $numOfRounds = count($model->eventRounds);
                            // try {
                            //     foreach ($model->eventTeams as $eT) :
                            //         foreach ($model->eventRounds as $eR) :
                            //             $eventTeamRound = new EventTeamRound();
                            //             $eventTeamRound->event_team_id = $eT->id;
                            //             $eventTeamRound->event_round_id = $eR->id;
                            //             $eventTeamRound->save(false);
                            //         endforeach;
                            //     endforeach;
                            // } catch (Exception $e) {
                            //     throw new Exception("Duplicate Entry");
                            // }
                        //
                        // //create event_round_match
                        $seed = range(1,$numOfTeams);
                        $away = array_splice($seed,(count($seed)/2));
                        $home = $seed;
                        // $rounds = count($seed) - 1;
                        for ($i=0; $i < count($home)+count($away)-1; $i++){
                            for ($j=0; $j<count($home); $j++){
                                $eventTeamHome = EventTeam::find()->where(['team_order' => $home[$j]])->one();
                                $eventTeamAway = EventTeam::find()->where(['team_order' => $away[$j]])->one();


                                $eventRoundMatch = new EventRoundMatch();
                                $eventRoundMatch->event_team1_round_id = $eventTeamHome->eventTeamRounds[$i]->id;
                                $eventRoundMatch->event_team2_round_id = $eventTeamAway->eventTeamRounds[$i]->id;
                                $eventRoundMatch->match_status_id = 1;
                                $eventRoundMatch->team1_score = 0;
                                $eventRoundMatch->team2_score = 0;
                                $eventRoundMatch->save(false);
                            }
                            if(count($home)+count($away)-1 > 2){
                                $splicedHome = array_splice($home,1,1);
                                $shiftedSplicedHome = array_shift($splicedHome);
                                array_unshift($away, $shiftedSplicedHome);
                                array_push($home,array_pop($away));
                            }
                        }


                $var = "RR" . $var . "numOf" . $numOfTeams . " bye" . $bye;
                }
                    break;
                case "Plain Ranking":
                    break;
                default:
                    break;
            }
        } else {
            $var = "insufficent num of team";
        }
        // make finalize button for event_team
        // 	count number of teams in selected event
        // 	create event rounds based on match_system formula
        // 	create team round based on event_round
        // 	give team order based on sort_order
        return $this->redirect(['view', 'var' => $var]);
    }
    /**
     * Finds the Event model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Event the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Event::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
