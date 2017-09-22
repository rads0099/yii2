<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\EventRoundMatch */

$this->title = 'Update Event Round Match: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Event Round Matches', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="event-round-match-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
