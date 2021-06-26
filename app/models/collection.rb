class Collection < ApplicationRecord
  belongs_to :user
  has_many :records
  has_many :images, dependent: :destroy

  validates :name, presence: true
end
