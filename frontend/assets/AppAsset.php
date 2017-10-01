<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
      'https://fonts.googleapis.com/css?family=Roboto:400,500,700',
      'https://fonts.googleapis.com/css?family=Open+Sans"',
      'css/animate.css',
      'css/mycss.css',
      'css/site.css',




    ];
    public $js = [
        'https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',


    ];
}
