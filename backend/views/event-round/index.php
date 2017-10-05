<?php

use yii\helpers\Html;
//use yii\grid\GridView;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EventRoundSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Event Rounds';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-round-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Event Round', ['create'], ['class' => 'btn btn-success']) ?>
    </p> -->

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'id' => 'install-grid',
            'dataProvider' => $dataProvider,
            'resizableColumns' => false,
            'showPageSummary' => false,
            'headerRowOptions' => ['class' => 'kartik-sheet-style'],
            'filterRowOptions' => ['class' => 'kartik-sheet-style'],
            'responsive' => true,
            'hover' => true,
            'panel' => [
                'heading' => '<h3 class="panel-title"> Events</h3>',
                'type' => 'primary',
                'showFooter' => false
            ],
            // set your toolbar
            'toolbar' => [
                ['content' =>
                    Html::a('<i class="glyphicon glyphicon-plus"></i>  Create Event ', ['create'], ['class' => 'btn btn-success create-backup margin-right5'])
                ],
            ],

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'event_id',
            'round',
            'round_status_id',
            'date_start',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
