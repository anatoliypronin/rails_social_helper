class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.text :description, null: false
      t.string :title, null: false
      t.string :address, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
