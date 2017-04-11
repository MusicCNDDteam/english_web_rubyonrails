class RenameColumnTypeOfQuizQuestion < ActiveRecord::Migration[5.0]
  def change
    rename_column :quiz_questions, :type, :question_type
  end
end
