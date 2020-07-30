class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0
      t.string :website_url
      t.string :linkedin_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :instagram_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
