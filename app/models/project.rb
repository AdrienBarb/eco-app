class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles
  has_and_belongs_to_many :tags, uniq: true
  has_many :votes

  attr_accessor :tag_names

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :description, type: :text
      indexes :tags, type: :text
    end
  end

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end
end
