class AddUniqueIndexForTables < ActiveRecord::Migration[6.0]
  def change
    add_index :companies, :email_registration, unique: true
    add_index :companies, :email_notification, unique: true
    add_index :companies, :phone, unique: true
    add_index :users, :phone, unique: true
    remove_reference :companies, :district, foreign_key: true
    add_reference :companies, :district, foreign_key: true, null: false, default: 1
  end
end
