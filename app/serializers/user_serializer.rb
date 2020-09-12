class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:name,:DOB,:address
  has_many :user_trips
end
