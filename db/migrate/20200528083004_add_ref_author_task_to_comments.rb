class AddRefAuthorTaskToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :author, polymorphic: true
    add_reference :comments, :task, foreign_key: true, null: false, default: 0
  end
end
