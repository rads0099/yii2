<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Event */

$this->title = 'Create Event';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-create">
	<!-- <p>
    <?= Html::a('Return to view', ['event/index'], ['class' => 'fa fa-arrow-circle-left btn btn-primary']) ?>
     </p> -->
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
