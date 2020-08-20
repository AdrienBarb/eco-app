class ProjectSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :category
  has_many :tags

  attributes :id, :description, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url
end
