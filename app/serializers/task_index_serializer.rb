class TaskIndexSerializer < ActiveModel::Serializer
  attributes :title, :description, :address

  belongs_to :city
  belongs_to :district
  belongs_to :services
  belongs_to :user
end
