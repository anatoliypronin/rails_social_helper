class UserShowSerializer < ActiveModel::Serializer
  attributes :first_name, :second_name, :city, :phone, :email

end