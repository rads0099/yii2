<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "team_event".
 *
 * @property string $id
 * @property string $team_id
 * @property int $event_type_id
 * @property int $team_status_id
 * @property int $champ
 * @property int $first
 * @property int $second
 * @property int $wins
 * @property int $draws
 * @property int $losses
 * @property int $rating
 * @property string $last_played
 * TODO: add event_id as foreign key in database and generate teamEvent model and crud again using gii
 * @property EventTeam[] $eventTeams
 * @property Player[] $players
 * @property EventType $eventType
 * @property TeamStatus $teamStatus
 */
class TeamEvent extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'team_event';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['team_id', 'event_type_id', 'team_status_id', 'champ', 'first', 'second', 'wins', 'draws', 'losses'], 'required'],
            [['event_type_id', 'team_status_id', 'champ', 'first', 'second', 'wins', 'draws', 'losses', 'rating'], 'integer'],
            [['last_played'], 'safe'],
            [['team_id'], 'string', 'max' => 25],
            [['event_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => EventType::className(), 'targetAttribute' => ['event_type_id' => 'id']],
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
            'team_id' => 'Team ID',
            'event_type_id' => 'Event Type ID',
            'team_status_id' => 'Team Status ID',
            'champ' => 'Champ',
            'first' => 'First',
            'second' => 'Second',
            'wins' => 'Wins',
            'draws' => 'Draws',
            'losses' => 'Losses',
            'rating' => 'Rating',
            'last_played' => 'Last Played',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEventTeams()
    {
        return $this->hasMany(EventTeam::className(), ['team_event_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlayers()
    {
        return $this->hasMany(Player::className(), ['team_event_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeam()
    {
        return $this->hasOne(Team::className(), ['id' => 'team_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEventType()
    {
        return $this->hasOne(EventType::className(), ['id' => 'event_type_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeamStatus()
    {
        return $this->hasOne(TeamStatus::className(), ['id' => 'team_status_id']);
    }
}
