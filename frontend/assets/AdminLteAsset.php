<?php
namespace frontend\assets;
use yii\base\Exception;
use yii\web\AssetBundle as BaseAdminLteAsset;
/**
 * AdminLte AssetBundle
 * @since 0.1
 */
class AdminLteAsset extends BaseAdminLteAsset
{
    public $sourcePath = '@backend/web/css/bower_components/dist';
    public $css = [
        'css/AdminLTE.min.css',
    ];
    public $js = [
        'js/app.min.js',
    ];
    public $depends = [
        //'rmrevin\yii\fontawesome\AssetBundle',
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
        'yii\bootstrap\BootstrapPluginAsset',
    ];
    /**
     * @var string|bool Choose skin color, eg. `'skin-blue'` or set `false` to disable skin loading
     * @see https://almsaeedstudio.com/themes/AdminLTE/documentation/index.html#layout
     */
    public $skin = '_all-skins';
    /**
     * @inheritdoc
     */
    public function init()
    {
        // Append skin color file if specified
        if ($this->skin) {
            if (('_all-skins' !== $this->skin) && (strpos($this->skin, 'skin-') !== 0)) {
                throw new Exception('Invalid skin specified');
            }
            $this->css[] = sprintf('css/skins/%s.min.css', $this->skin);
        }
        parent::init();
    }
}