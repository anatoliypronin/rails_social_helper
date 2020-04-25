class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :title
      t.string :address
      t.string :state

      t.timestamps
    end
  end
end
