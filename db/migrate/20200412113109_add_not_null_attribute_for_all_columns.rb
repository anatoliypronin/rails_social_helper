class AddNotNullAttributeForAllColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :first_name, false
    change_column_null :users, :second_name, false
    change_column_null :users, :password, false
    change_column_null :users, :email, false
    change_column_null :users, :phone, false
    change_column_null :users, :state, false
  end
end