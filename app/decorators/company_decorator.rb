class CompanyDecorator < ApplicationDecorator
  def full_address
    "#{object.city} #{object.district} #{object.address}"
  end
end
