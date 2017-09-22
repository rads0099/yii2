<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Team;

/**
 * TeamSearch represents the model behind the search form of `common\models\Team`.
 */
class TeamSearch extends Team
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'champ', 'first', 'second', 'wins', 'draws', 'losses', 'rating'], 'integer'],
            [['team', 'team_status_id', 'since', 'last_played'], 'safe'],
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
        //hides team 0 = Bye
        $query = Team::find()->where('`team`.`id` != 0');
        $query->joinWith('teamStatus');

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
            'champ' => $this->champ,
            'first' => $this->first,
            'second' => $this->second,
            'wins' => $this->wins,
            'draws' => $this->draws,
            'losses' => $this->losses,
            'rating' => $this->rating,
            'last_played' => $this->last_played,
        ]);

        $query->andFilterWhere(['like', 'team', $this->team . '%', false])
              ->andFilterWhere(['like', 'status', $this->team_status_id . '%', false])
              ->andFilterWhere(['like', 'since', $this->since . '%', false]);
            //   ->andFilterWhere(['like', 'rating', $this->rating . '%', false]);

        return $dataProvider;
    }
}
