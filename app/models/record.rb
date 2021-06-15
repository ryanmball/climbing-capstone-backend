class Record < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: true
  belongs_to :route
end
