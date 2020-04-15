class AddIndexToUniqueAttributeForCompany < ActiveRecord::Migration[6.0]
  def change
    add_index :companies, [:name], unique: true
    add_index :companies, [:address], unique: true
    add_index :companies, [:email_registration], unique: true
    add_index :companies, [:email_notification], unique: true
    add_index :companies, [:password_digest], unique: true
    add_index :companies, [:phone], unique: true
  end
end
