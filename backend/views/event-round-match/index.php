<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EventRoundMatchSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Event Round Matches';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-round-match-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Event Round Match', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'event_team1_round_id',
            'event_team2_round_id',
            'match_status_id',
            'team1_score',
            // 'team2_score',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
