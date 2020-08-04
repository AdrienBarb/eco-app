class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles
end
