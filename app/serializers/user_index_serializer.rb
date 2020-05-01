class UserIndexSerializer < ActiveModel::Serializer
  attributes :first_name, :second_name, :email
end