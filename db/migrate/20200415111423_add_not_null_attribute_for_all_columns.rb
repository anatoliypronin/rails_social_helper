class AddNotNullAttributeForAllColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :companies, :name, false 
    change_column_null :companies, :city, false 
    change_column_null :companies, :district, false 
    change_column_null :companies, :address, false 
    change_column_null :companies, :email_registration, false 
    change_column_null :companies, :email_notification, false 
    change_column_null :companies, :password_digest, false 
    change_column_null :companies, :state, false 
    change_column_null :companies, :phone, false 
  end
end
