class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.index ['name'], name: 'index_service_on_name', unique: true
      t.index ['service_id'], name: 'index_companie_s_on_service_id'
      t.timestamps
      t.bigint 'service_id'
    end
    add_reference :companies, :service, foreign_key: true
  end
end