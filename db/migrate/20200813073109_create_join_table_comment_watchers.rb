class CreateJoinTableCommentWatchers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :comments, :users, table_name: :comment_watchers do |t|
      # t.index [:comment_id, :user_id]
      # t.index [:user_id, :comment_id]
    end
  end
end
