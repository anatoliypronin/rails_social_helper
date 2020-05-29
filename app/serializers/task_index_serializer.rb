class TaskIndexSerializer < ActiveModel::Serializer
  attributes :title, :description, :address

  belongs_to :city
  belongs_to :district
  has_many :services
  belongs_to :user

  def services
    customized_services = []

    object.services.each do |service|
      custom_service = service["name"]

      customized_services.push(custom_service)
      customized_services.push("  ")
    end

    return customized_services
  end
 
end
