class RecordSerializer < ActiveModel::Serializer
  attributes :id, :date, :grade, :result, :in_progress, :rating, :partner, :comments, :user_id, :route

  # belongs_to :route
  belongs_to :collection
  belongs_to :user
end
