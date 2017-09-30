<?php

namespace backend\controllers;

use Yii;
use common\models\EventTeam;
use backend\models\EventTeamSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
/**
 * EventTeamController implements the CRUD actions for EventTeam model.
 */
class EventTeamController extends Controller
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
     * Lists all EventTeam models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new EventTeamSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single EventTeam model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-event-team')) {

            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new EventTeam model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-event-team')) {
            $model = new EventTeam();
            if ($model->load(Yii::$app->request->post())) {
                $model->team_event_id = Yii::$app->db->
                    createCommand('SELECT id FROM team_event WHERE team_id =' . $model->team_name . ' and event_type_id =' . $model->event_type_name)
                ->queryScalar();
                //TODO: check event type on both event & team_event table
                $model->event_team_status_id = 1;
                $model->team_order = 0;
                $model->save(false);
                Yii::$app->session->setFlash('success','Successfully Created');
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
     * Updates an existing EventTeam model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-event-team')) {
            $model = $this->findModel($id);
            $model->team_name = $model->teamEvent->team_id;
            $model->event_type_name = $model->teamEvent->event_type_id;

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                Yii::$app->session->setFlash('success','Successfully Updated');
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
     * Deletes an existing EventTeam model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-event-team')) {
            $this->findModel($id)->delete();
            Yii::$app->session->setFlash('success','Successfully Delete');
            return $this->redirect(['index']);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the EventTeam model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return EventTeam the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = EventTeam::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
