class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :partners, :highlights

  has_many :images
  belongs_to :user
end
