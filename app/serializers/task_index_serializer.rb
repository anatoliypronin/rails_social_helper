class TaskIndexSerializer < ActiveModel::Serializer
  attributes :title, :description, :address

  belongs_to :city
  belongs_to :district
  belongs_to :service
  belongs_to :user
end
