class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:name,:DOB,:address
end
