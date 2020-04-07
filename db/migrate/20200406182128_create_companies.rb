class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :district
      t.string :adress
      t.string :email_registration
      t.string :email_notification
      t.string :password
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
