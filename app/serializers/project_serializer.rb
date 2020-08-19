class ProjectSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :category

  attributes :id, :name, :description
end
