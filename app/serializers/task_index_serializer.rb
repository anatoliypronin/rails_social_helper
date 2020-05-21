class TaskIndexSerializer < ActiveModel::Serializer
  attributes :title, :description, :city_id, :district_id, :address, :user_id, :service_id
end
  