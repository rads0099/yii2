<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\EventRoundMatchSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="event-round-match-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'event_team1_round_id') ?>

    <?= $form->field($model, 'event_team2_round_id') ?>

    <?= $form->field($model, 'match_status_id') ?>

    <?= $form->field($model, 'team1_score') ?>

    <?php // echo $form->field($model, 'team2_score') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
