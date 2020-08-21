class AnswerSerializer < ActiveModel::Serializer
  belongs_to :comment
  belongs_to :user
  attributes :id, :answer
end
