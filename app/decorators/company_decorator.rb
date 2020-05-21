class CompanyDecorator < ApplicationDecorator
  def full_address
    "Город: #{object.city.name} район:#{object.district.name} адрес: #{object.address}"
  end
end
