class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :profile_pic, :email

  # has_many :collections
  # has_many :records

end
