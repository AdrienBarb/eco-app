class AddUrlLinkedinToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :url_linkedin, :string
  end
end
