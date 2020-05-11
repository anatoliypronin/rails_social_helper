# frozen_string_literal: true

class UserIndexSerializer < ActiveModel::Serializer
  attributes :first_name, :second_name, :email
end
