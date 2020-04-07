class CreateRenameColumnPasswords < ActiveRecord::Migration[6.0]
  def change
      rename_column :companies, :password, :password_digest
  end
end
