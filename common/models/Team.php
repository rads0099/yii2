<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "team".
 *
 * @property string $id
 * @property string $team
 * @property int $team_status_id
 * @property int $champ
 * @property int $first
 * @property int $second
 * @property int $wins
 * @property int $draws
 * @property int $losses
 * @property int $rating
 * @property string $since
 * @property string $last_played
 *
 * @property TeamStatus $teamStatus
 */
class Team extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'team';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['team', 'team_status_id', 'champ', 'first', 'second', 'wins', 'draws', 'losses', 'since'], 'required'],
            [['team_status_id', 'champ', 'first', 'second', 'wins', 'draws', 'losses', 'rating'], 'integer'],
            [['since', 'last_played'], 'safe'],
            [['team'], 'string', 'max' => 25],
            [['team'], 'unique'],
            [['team_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => TeamStatus::className(), 'targetAttribute' => ['team_status_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'team' => 'Team Name',
            'team_status_id' => 'Team Status ID',
            'champ' => 'Champ',
            'first' => 'First',
            'second' => 'Second',
            'wins' => 'Wins',
            'draws' => 'Draws',
            'losses' => 'Losses',
            'rating' => 'Rating',
            'since' => 'Created at',
            'last_played' => 'Last Played',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeamStatus()
    {
        return $this->hasOne(TeamStatus::className(), ['id' => 'team_status_id']);
    }
}
