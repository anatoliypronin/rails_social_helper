class AddColumnSrateCompanyToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :state_company, :string
  end
end
