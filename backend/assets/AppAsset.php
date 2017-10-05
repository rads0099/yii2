<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/bower_components/bootstrap/dist/css/bootstrap.min.css',
        'css/bower_components/font-awesome/css/font-awesome.min.css',
        'css/site.css',
    ];
    public $js = [
      'js/main.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
