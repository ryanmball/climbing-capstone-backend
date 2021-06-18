class Record < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: true
  belongs_to :route

  validates :date, presence: true
  validates :route_id, presence: true
  validates :grade, presence: true
  validates :result, presence: true
  validates :user_id, presence: true
end
