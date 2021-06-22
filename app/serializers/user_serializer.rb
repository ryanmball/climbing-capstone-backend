class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  has_many :collections
  has_many :records

  # def current_user?
  #   current_user.id == :id
  # end
end
