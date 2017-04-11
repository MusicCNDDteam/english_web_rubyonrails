class AddQuizAndTopicRelationship < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :topic_id, :integer
  end
end
