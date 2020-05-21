class AddCityRefToCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :city, :string
    add_reference :companies, :city, foreign_key: true, null: false, default: 0
  end
end
