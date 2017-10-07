<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\Occasion;
use common\models\Location;
use common\models\Venue;
use common\models\EventCategory;
use common\models\EventType;
use common\models\MatchSystem;
use common\models\Sort;
use common\models\Order;
use kartik\select2\Select2;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model common\models\Event */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="event-form" id="modalCreate">
    <div class="box box-default">
      <!-- /.box-header -->
      <?php $form = ActiveForm::begin(); ?>

      <div class="box-body">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
               <?= $form->field($model, 'occasion_dd')->widget(Select2::classname(), [
                  'data' => ArrayHelper::map(Occasion::find()->orderBy('id')->all(),'id','occasion'),
                  'language' => 'en',
                  'options' => ['placeholder' => 'Select Occasion'],
                  'pluginOptions' => [
                      'allowClear' => true
                  ],
              ])->label('Occasion *');
              ?>
              <?= $form->field($model, 'location_dd')->widget(Select2::classname(), [
                  'data' => ArrayHelper::map(Location::find()->orderBy('id')->all(),'id','location'),
                  'language' => 'en',
                  'options' => ['placeholder' => 'Select Location'],
                  'pluginOptions' => [
                      'allowClear' => true
                  ],
              ])->label('Location');
              ?>
              <!-- TODO: make venue field dropdown dependent to location -->
              <?= $form->field($model, 'venue_dd')->widget(Select2::classname(), [
                  'data' => ArrayHelper::map(Venue::find()->orderBy('id')->all(),'id','venue'),
                  'language' => 'en',
                  'options' => ['placeholder' => 'Select Venue'],
                  'pluginOptions' => [
                      'allowClear' => true
                  ],
              ])->label('Venue');
              ?>
              <?= $form->field($model, 'event')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

              <?= $form->field($model, 'event_type_dd')->widget(Select2::classname(), [
                  'data' => ArrayHelper::map(EventType::find()->orderBy('id')->all(),'id','type'),
                  'language' => 'en',
                  'options' => ['placeholder' => 'Select Event Type'],
                  'pluginOptions' => [
                      'allowClear' => true
                  ],
                  ])->label('Event Type');
              ?>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-6">
            <div class="form-group">
                <?= $form->field($model, 'event_category_dd')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(EventCategory::find()->orderBy('id')->all(),'id','category'),
                    'language' => 'en',
                    'options' => ['placeholder' => 'Select Category'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    ])->label('Event Category');
                ?>


                <?= $form->field($model, 'match_system_dd')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(MatchSystem::find()->orderBy('id')->all(),'id','system'),
                    'language' => 'en',
                    'options' => ['placeholder' => 'Select System'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    ])->label('Match System');
                ?>

                <?= $form->field($model, 'sort_dd')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(Sort::find()->orderBy('id')->all(),'id','sort'),
                    'language' => 'en',
                    'options' => ['placeholder' => 'Select Sort Type'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    ])->label('Sort');
                ?>

                <!--TODO: make order field dropdown dependent to sort -->
                <?= $form->field($model, 'order_dd')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(Order::find()->orderBy('id')->all(),'id','order'),
                    'language' => 'en',
                    'options' => ['placeholder' => 'Select Order Type'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    ])->label('Order');
                ?>

                <?php //echo $form->field($model, 'min_team')->textInput() ?>

                <?php //echo $form->field($model, 'max_team')->textInput() ?>

                <?php //echo $form->field($model, 'champ')->textInput(['maxlength' => true]) ?>

                <?php //echo $form->field($model, 'first')->textInput(['maxlength' => true]) ?>

                <?php //echo $form->field($model, 'second')->textInput(['maxlength' => true]) ?>

                <!--TODO: Add date picker for date fields -->
                <?= $form->field($model, 'date_start')->textInput() ?>

                <?= $form->field($model, 'date_end')->textInput() ?>



                </div>
            </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer">
          <div class="form-group">
              <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
          </div>

          <?php ActiveForm::end(); ?>

      </div>
    </div>
  </div>
