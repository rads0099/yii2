<?php

namespace backend\controllers;

use Yii;
use common\models\Team;
use common\models\TeamEvent;
use backend\models\TeamSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * TeamController implements the CRUD actions for Team model.
 */
class TeamController extends Controller
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
     * Lists all Team models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TeamSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Team model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-team')) {
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Team model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-team')) {
            $model = new Team();
            $eventTypeCtr = 0;

            if ($model->load(Yii::$app->request->post())) {
                $model->team_status_id = 3;
                $model->champ = 0;
                $model->first = 0;
                $model->second = 0;
                $model->wins = 0;
                $model->draws = 0;
                $model->losses = 0;
                $model->rating = 0;
                $model->since = date('Y');
                // $model->last_played = '0000';

                //TODO: catch team already exists exception
                $model->save();

                $eventTypeCtr = Yii::$app->db->
                  createCommand('SELECT COUNT(*) FROM event_type')
                ->queryScalar();
                for ($x = 1; $x <= $eventTypeCtr; $x++) {
                    $teamEvent = new TeamEvent();
                    $teamEvent->team_id = $model->id;
                    $teamEvent->event_type_id = $x;
                    $teamEvent->team_status_id = 3;
                    $teamEvent->champ = 0;
                    $teamEvent->first = 0;
                    $teamEvent->second = 0;
                    $teamEvent->wins = 0;
                    $teamEvent->draws = 0;
                    $teamEvent->losses = 0;
                    $teamEvent->rating = 0;
                    $teamEvent->save();
                }
                // $teamEvent->last_played = '0000';

                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Team model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('create-team')) {
            $model = $this->findModel($id);

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Team model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */

    //TODO: also delete team_event data
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-team')) {
            $this->findModel($id)->delete();
            return $this->redirect(['index']);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Team model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Team the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Team::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
