class AddCategoryToProject < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :category, null: false, foreign_key: true
  end
end
