class AddAbilityToSkills < ActiveRecord::Migration[6.0]
  def change
    add_reference :skills, :ability, foreign_key: true
  end
end
