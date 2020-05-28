class CreateTaskServices < ActiveRecord::Migration[6.0]
  def change
    create_table :task_services do |t|
      t.references :task, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
    add_index :task_services, %i[task_id service_id], unique: true
  end
end
