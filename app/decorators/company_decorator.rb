class CompanyDecorator < ApplicationDecorator
  def full_address
    "#{object.city} #{object.district} #{object.address}"
  end
    
  def created_at
    object.created_at.strftime('%d-%m-%Y %I:%M')
  end
end
