class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :project
  attributes :id, :comment
end
