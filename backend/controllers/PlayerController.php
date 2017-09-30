<?php

namespace backend\controllers;

use Yii;
use common\models\Player;
use common\models\EventType;
use common\models\Team;
use backend\models\PlayerSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

/**
 * PlayerController implements the CRUD actions for Player model.
 */
class PlayerController extends Controller
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
     * Lists all Player models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PlayerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Player model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-player')) {
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Player model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-player')) {
            $model = new Player();
            $eventType = new EventType();
            $team = new Team();

            if ($model->load(Yii::$app->request->post()) &&
            $eventType->load(Yii::$app->request->post()) &&
                 $team->load(Yii::$app->request->post())) {
                //TODO: erase this comment
                // $temp->team_event_id = (new \yii\db\Query())
                //     ->select('id')
                //     ->from('team_event')
                //     ->where('event_type_id=:event_type_id', [':event_type_id', $eventType->id])
                //     ->one();
                // $model->team_event_id = $temp->team_event_id;
                $model->team_event_id = Yii::$app->db->
                    createCommand('SELECT id FROM team_event WHERE event_type_id =' . $eventType->id . ' and team_id =' . $team->id)
                ->queryScalar();
                $model->save();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'eventType' => $eventType,
                    'team' => $team,
                ]);
            }
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Player model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-player')) {
            $model = $this->findModel($id);
            $eventType = new EventType();
            $team = new Team();

            $eventType->id = $model->teamEvent->event_type_id;
            $team->id = $model->teamEvent->team_id;

            if ($model->load(Yii::$app->request->post()) &&
            $eventType->load(Yii::$app->request->post()) &&
                 $team->load(Yii::$app->request->post())) {

                $model->team_event_id = Yii::$app->db->
                    createCommand('SELECT id FROM team_event WHERE event_type_id =' . $eventType->id . ' and team_id =' . $team->id)
                ->queryScalar();
                $model->save();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'eventType' => $eventType,
                    'team' => $team,
                ]);
            }
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Player model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-player')) {
            $this->findModel($id)->delete();
            return $this->redirect(['index']);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Player model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Player the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Player::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
