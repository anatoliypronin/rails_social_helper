class AddCityAndDistrictRefToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :city, foreign_key: true
    add_reference :tasks, :district, foreign_key: true
  end
end
