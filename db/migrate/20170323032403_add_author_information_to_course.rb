class AddAuthorInformationToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :author_id, :integer
  end
end
