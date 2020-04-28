# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :district, null: false
      t.string :address, null: false
      t.string :email_registration, null: false
      t.string :email_notification, null: false
      t.string :password_digest, null: false
      t.string :state, null: false
      t.string :phone, null: false
      t.index ['name'], name: 'index_companies_on_name', unique: true

      t.timestamps
    end
  end
end
