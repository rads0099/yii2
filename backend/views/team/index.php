<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\TeamSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Teams';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="team-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Team', ['create'], ['class' => 'btn btn-success']) ?>
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
                  'heading' => '<h3 class="panel-title"> Team</h3>',
                  'type' => 'primary',
                  'showFooter' => false
              ],
              // set your toolbar
              'toolbar' => [
                  ['content' =>
                      Html::a('<i class="glyphicon glyphicon-plus"></i>  Create Team ', ['create'], ['class' => 'btn btn-success create-backup margin-right5'])
                  ],
              ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            'team',
            [
                'label' => 'Team Status',
                'attribute' => 'team_status_id',
                'value' => 'teamStatus.status'
            ],
            'champ',
            'first',
            'second',
            'wins',
            'draws',
            'losses',
            'since',
            'rating',
            'last_played',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
