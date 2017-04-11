class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :name
      t.string :description
      t.string :content
      t.integer  "topic_id"
      t.timestamps
    end
  end
end
