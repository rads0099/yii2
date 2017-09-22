<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\EventRoundMatch */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Event Round Matches', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-round-match-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'event_team1_round_id',
            'event_team2_round_id',
            'match_status_id',
            'team1_score',
            'team2_score',
        ],
    ]) ?>

</div>
