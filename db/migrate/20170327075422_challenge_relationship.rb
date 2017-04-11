class ChallengeRelationship < ActiveRecord::Migration[5.0]
  def change
    add_column :quiz_questions, :quiz_id, :integer
    add_column :quiz_answers, :quiz_question_id, :integer
  end
end
