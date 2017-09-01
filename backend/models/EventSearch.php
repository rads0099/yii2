<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Event;

/**
 * EventSearch represents the model behind the search form of `common\models\Event`.
 */
class EventSearch extends Event
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'occasion_id', 'location_venue_id', 'event_type_id', 'event_category_id', 'event_status_id', 'match_system_id', 'sort_id', 'min_team', 'max_team', 'champ', 'first', 'second'], 'integer'],
            [['event', 'description', 'date_start', 'date_end'], 'safe'],
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
        $query = Event::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'occasion_id' => $this->occasion_id,
            'location_venue_id' => $this->location_venue_id,
            'event_type_id' => $this->event_type_id,
            'event_category_id' => $this->event_category_id,
            'event_status_id' => $this->event_status_id,
            'match_system_id' => $this->match_system_id,
            'sort_id' => $this->sort_id,
            'min_team' => $this->min_team,
            'max_team' => $this->max_team,
            'champ' => $this->champ,
            'first' => $this->first,
            'second' => $this->second,
            'date_start' => $this->date_start,
            'date_end' => $this->date_end,
        ]);

        $query->andFilterWhere(['like', 'event', $this->event])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
