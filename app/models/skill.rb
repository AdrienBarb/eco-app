class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :ability
  has_many :recommendations, dependent: :destroy

end
