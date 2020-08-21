class AnswerSerializer < ActiveModel::Serializer
  belongs_to :comment
  attributes :id, :answer
end
