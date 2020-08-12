class AddRateToSkill < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :rate, :integer
  end
end
