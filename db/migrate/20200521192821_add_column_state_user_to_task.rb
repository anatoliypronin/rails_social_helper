class AddColumnStateUserToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :state_user, :string
  end
end
