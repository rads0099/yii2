<?php
/**
*for the sample commit, delete me after
* kulang mga files?
* hindi man kulang
* UNIMPORTANT UPDATE
* ok push mo na commit mo
* push ko na
<<<<<<< HEAD
*edit na
=======
* try
* try part 2
>>>>>>> 4c5707b1757f145e2f93b6493d388ba7c5a62a68
*/

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\EventRoundMatch;

/**
 * EventRoundMatchSearch represents the model behind the search form of `common\models\EventRoundMatch`.
 */
class EventRoundMatchSearch extends EventRoundMatch
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'event_team1_round_id', 'event_team2_round_id', 'match_status_id', 'team1_score', 'team2_score'], 'integer'],
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
        $query = EventRoundMatch::find();

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
            'event_team1_round_id' => $this->event_team1_round_id,
            'event_team2_round_id' => $this->event_team2_round_id,
            'match_status_id' => $this->match_status_id,
            'team1_score' => $this->team1_score,
            'team2_score' => $this->team2_score,
        ]);

        return $dataProvider;
    }
}
<<<<<<< HEAD
=======
>>>>>>> ba9e862e4b410f45ed276679cf6a464e86e2e580
>>>>>>> 0f6c49c458af48c4f040b16b2070b56dd5516fa1
*/

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\EventRoundMatch;

/**
 * EventRoundMatchSearch represents the model behind the search form of `common\models\EventRoundMatch`.
 */
class EventRoundMatchSearch extends EventRoundMatch
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'event_team1_round_id', 'event_team2_round_id', 'match_status_id', 'team1_score', 'team2_score'], 'integer'],
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
        $query = EventRoundMatch::find();

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
            'event_team1_round_id' => $this->event_team1_round_id,
            'event_team2_round_id' => $this->event_team2_round_id,
            'match_status_id' => $this->match_status_id,
            'team1_score' => $this->team1_score,
            'team2_score' => $this->team2_score,
        ]);

        return $dataProvider;
    }
}
>>>>>>> before discard
