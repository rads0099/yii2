<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\OccasionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Occasions';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="occasion-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Occasion', ['create'], ['class' => 'btn btn-success']) ?>
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
                  'heading' => '<h3 class="panel-title"> Occasion</h3>',
                  'type' => 'primary',
                  'showFooter' => false
              ],
              // set your toolbar
              'toolbar' => [
                  ['content' =>
                      Html::a('<i class="glyphicon glyphicon-plus"></i>  Create Occasion ', ['create'], ['class' => 'btn btn-success create-backup margin-right5'])
                  ],
              ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            'occasion',
            'description',
            'date_start',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
