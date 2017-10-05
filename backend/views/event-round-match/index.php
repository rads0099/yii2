<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EventRoundMatchSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Event Round Matches';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-round-match-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Event Round Match', ['create'], ['class' => 'btn btn-success']) ?>
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
                  'heading' => '<h3 class="panel-title"> Events Team</h3>',
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

            // 'id',
            // [
            //     'label' => 'Occasion',
            //     'attribute' => 'event_team2_round_id',
            //     'value' => 'eventTeamRound.$event_round_id',
            // ],
            [
                'label' => 'Event',
                'attribute' => 'event_team2_round_id',
                'value' => 'eventTeam2Round.eventTeam.event.event'
            ],
            [
                'label' => 'Round',
                'attribute' => 'event_team2_round_id',
                'value' => 'eventTeam2Round.eventRound.round'
            ],
            [
                'label' => 'Team 1',
                'attribute' => 'event_team1_round_id',
                'value' => 'eventTeam1Round.eventTeam.teamEvent.team.team'
            ],
            [
                'label' => 'Team 2',
                'attribute' => 'event_team2_round_id',
                'value' => 'eventTeam2Round.eventTeam.teamEvent.team.team'
            ],
            // 'event_team1_round_id',
            // 'event_team2_round_id',
            // [
            //     'label' => 'Match Status',
            //     'attribute' => 'match_status_id',
            //     'value' => 'matchStatus.description'
            // ],
            'team1_score',
            'team2_score',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
