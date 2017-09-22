<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\assets\AdminLteAsset;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EventSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Events';
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="event-index">

   <!--  <h1><?= Html::encode($this->title) ?></h1>
    --> <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Event', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            'event',
            'description',
            [
                'label' => 'Occasion',
                'attribute' => 'occasion_name',
                'value' => 'occasion.occasion',
            ],
            [
                'label' => 'Location',
                'attribute' => 'location_name',
                'value' => 'location.location'
            ],
            [
                'label' => 'Venue',
                'attribute' => 'venue_name',
                'value' => 'venue.venue'
            ],
            [
                'label' => 'Category',
                'attribute' => 'event_category_id',
                'value' => 'eventCategory.category'
            ],
            [
                'label' => 'Status',
                'attribute' => 'event_status_id',
                'value' => 'eventStatus.status'
            ],
            [
                'label' => 'Match System',
                'attribute' => 'match_system_id',
                'value' => 'matchSystem.system'
            ],
            // 'sort_order_id',
            // 'min_team',
            // 'max_team',
            // 'champ',
            // 'first',
            // 'second',
            'date_start',
            'date_end',
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{myButton} {view} {update} {delete}',
                'buttons' => [
                    'myButton' => function($url, $model, $key) {     // render your custom button
                        return Html::a('Finalize', ['finalize', 'id' => $model->id], ['class' => 'btn btn-success btn-xs', 'data-pjax' => 0]);
                    }
                ]
            ],
        ],
    ]); ?>
</div>
