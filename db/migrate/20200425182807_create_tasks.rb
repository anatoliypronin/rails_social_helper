class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.string :title, null: false
      t.string :address, null: false
      t.string :state

      t.timestamps
    end
  end
end
