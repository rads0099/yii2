<?php

namespace backend\controllers;

use Yii;
use common\models\Event;
use backend\models\EventSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
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

        return $this->redirect(['index']);
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
