class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :respondent_id
      t.integer :question_id
      t.integer :answer_choice_id
      t.timestamps
    end
  end
end
