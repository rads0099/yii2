<?php

namespace backend\models;
/**Test sample*/
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Player;
use yii\db\Query;

/**
 * PlayerSearch represents the model behind the search form of `common\models\Player`.
 */
class PlayerSearch extends Player
{
    /**
     * @inheritdoc
     */
    public $team_name;
    public $event_type_name;

    public function rules()
    {
        return [
            [['id', 'team_event_id'], 'integer'],
            [['name', 'gender_id', 'team_name', 'event_type_name'], 'safe'],
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
        $query = Player::find();
        // add conditions that should always apply here

        $query->joinWith('gender');
        $query->joinWith('team');
        $query->joinWith('eventType');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        //FIXME: sort for team name and event type name
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

        $query->andFilterWhere(['like', 'name', $this->name])
              ->andFilterWhere(['like', 'gender.gender', $this->gender_id . '%', false])
              ->andFilterWhere(['like', 'team', $this->team_name . '%', false])
              ->andFilterWhere(['like', 'type', $this->event_type_name . '%', false]);
        return $dataProvider;
    }
}
