class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :partners, :highlights

  has_many :images
  has_many :records
  belongs_to :user
end
