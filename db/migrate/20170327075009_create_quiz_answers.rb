class CreateQuizAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_answers do |t|
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
