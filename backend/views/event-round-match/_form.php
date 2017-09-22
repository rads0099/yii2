<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EventRoundMatch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="event-round-match-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'event_team1_round_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'event_team2_round_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'match_status_id')->textInput() ?>

    <?= $form->field($model, 'team1_score')->textInput() ?>

    <?= $form->field($model, 'team2_score')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
