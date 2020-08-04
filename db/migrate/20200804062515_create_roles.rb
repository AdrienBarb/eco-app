class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
