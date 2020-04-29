class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.index ['name'], name: 'index_service_on_name', unique: true
      t.timestamps
    end
    add_reference :companies, :service, foreign_key: true
  end
end