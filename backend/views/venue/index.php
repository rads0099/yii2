<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\VenueSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Venues';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="venue-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Venue', ['create'], ['class' => 'btn btn-success']) ?>
    </p> -->

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
            'resizableColumns' => false,
              'showPageSummary' => false,
              'headerRowOptions' => ['class' => 'kartik-sheet-style'],
              'filterRowOptions' => ['class' => 'kartik-sheet-style'],
              'responsive' => true,
              'hover' => true,
              'panel' => [
                  'heading' => '<h3 class="panel-title"> Venue</h3>',
                  'type' => 'primary',
                  'showFooter' => false
              ],
              // set your toolbar
              'toolbar' => [
                  ['content' =>
                      Html::a('<i class="glyphicon glyphicon-plus"></i>  Create Venue ', ['create'], ['class' => 'btn btn-success create-backup margin-right5'])
                  ],
              ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'venue',
            'description',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
