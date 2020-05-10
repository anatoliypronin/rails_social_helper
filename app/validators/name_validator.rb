# frozen_string_literal: true

class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'invalid name') unless value =~ /\A([а-яА-Я]+( |-)){0,2}[а-яА-Я]+\z/
  end
end
