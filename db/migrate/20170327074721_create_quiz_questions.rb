class CreateQuizQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_questions do |t|
      t.string :name
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
