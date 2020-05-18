class AddNotNullToCompanyColumnTaskTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tasks, :company
    add_reference :tasks, :company, foreign_key: false, null: true
  end
end
