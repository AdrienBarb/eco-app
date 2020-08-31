class Category < ApplicationRecord
has_many :project, dependent: :destroy

validates :name, uniqueness: true

end
