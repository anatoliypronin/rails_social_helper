class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name, null: false

      t.timestamps
      t.references :city, null: false, foreign_key: true
    end
  end
end
