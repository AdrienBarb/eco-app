class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles
  has_and_belongs_to_many :tags, uniq: true

  attr_accessor :tag_names

  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end
end
