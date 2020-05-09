# frozen_string_literal: true

class NameValidator < ActiveModel::EachValidator
  NameValue = begin
    russian_letter = /\A([а-яА-Я]+( |-)){0,2}[а-яА-Я]+\z/
  end

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'invalid name') unless value =~ NameValue
  end
end
