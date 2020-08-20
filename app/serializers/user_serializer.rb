class UserSerializer < ActiveModel::Serializer
  has_many :project
  attributes :id, :first_name, :last_name, :phone_number, :city, :zip_code, :country, :title, :description
end
