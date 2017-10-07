<?php

use yii\helpers\Html;
use yii\helpers\Url;


/* @var $this yii\web\View */
/* @var $model common\models\Event */

$this->title = 'Create Event';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-create">
<<<<<<< HEAD
	<!-- <p>
    <?= Html::a('Return to view', ['event/index'], ['class' => 'fa fa-arrow-circle-left btn btn-primary']) ?>
     </p> -->
    <?= $this->render('_form', [
=======
	<p>
    <?= Html::button('Return to view', ['value'=>Url::to('index')], ['class' => 'fa fa-arrow-circle-left btn btn-primary']) ?>

     </p>
    <?= $this->renderAjax('_form', [
>>>>>>> c2299e5d9b1a3cc3818af4c823500cfe25ff6090
        'model' => $model,
    ]) ?>

</div>
