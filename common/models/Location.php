<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "location" test.
 *
 * @property int $id
 * @property string $location
 * @property string $address
 * @property string $description
 *
 * @property LocationVenue[] $locationVenues
 * @property Venue[] $venues
 */
class Location extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'location';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['location'], 'required'],
            [['location'], 'string', 'max' => 25],
            [['address', 'description'], 'string', 'max' => 250],
            [['location'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'location' => 'Location',
            'address' => 'Address',
            'description' => 'Description',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocationVenues()
    {
        return $this->hasMany(LocationVenue::className(), ['location_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVenues()
    {
        return $this->hasMany(Venue::className(), ['location_id' => 'id']);
    }
}
