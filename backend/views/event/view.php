<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Event */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-view">

    <p>
        <!-- <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?> -->

         <?= Html::a('Return to view', ['event/index'], ['class' => 'fa fa-arrow-circle-left btn btn-primary']) ?>
       
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'occasion.occasion',
            'location.location',
            'eventType.type',
            'event',
            'description',
            'eventCategory.category',
            'eventStatus.status',
            'matchSystem.system',
            'sortOrder.sort.sort',
            'sortOrder.order.order',
            'min_team',
            'max_team',
            'champ',
            'first',
            'second',
            'date_start',
            'date_end',
        ],
    ]) ?>

</div>
