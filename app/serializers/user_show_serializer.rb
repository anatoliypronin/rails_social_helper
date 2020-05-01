# frozen_string_literal: true

class UserShowSerializer < ActiveModel::Serializer
  attributes :first_name, :second_name, :city, :phone, :email
end
