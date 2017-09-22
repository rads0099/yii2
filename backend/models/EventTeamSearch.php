<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\EventTeam;

/**
 * EventTeamSearch represents the model behind the search form of `common\models\EventTeam`.
 */
class EventTeamSearch extends EventTeam
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'team_event_id', 'team_order', 'total_wins', 'total_draws', 'total_loss'], 'integer'],
            [['event_id', 'event_team_status_id', 'team_name', 'event_type_name'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = EventTeam::find();
        $query->joinWith('eventTeamStatus');
        $query->joinWith('team');
        $query->joinWith('eventType');

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['team_name'] = [
            'asc' => ['team' => SORT_ASC],
            'desc' => ['team' => SORT_DESC],
        ];

        $dataProvider->sort->attributes['event_type_name'] = [
            'asc' => ['type' => SORT_ASC],
            'desc' => ['type' => SORT_DESC],
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            // 'event_id' => $this->event_id,
            // 'team_event_id' => $this->team_event_id,
            // 'event_team_status_id' => $this->event_team_status_id,
            // 'team_order' => $this->team_order,
            'total_wins' => $this->total_wins,
            'total_draws' => $this->total_draws,
            'total_loss' => $this->total_loss,
        ]);

        $query->andFilterWhere(['like', 'event', $this->event_id])
            ->andFilterWhere(['like', 'team', $this->team_name])
            ->andFilterWhere(['like', 'type', $this->event_type_name])
            ->andFilterWhere(['like', 'status', $this->event_team_status_id . '%', false]);
        return $dataProvider;
    }
}
