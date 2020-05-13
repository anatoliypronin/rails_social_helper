class CreateCommentUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_users do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comment_users, %i[comment_id user_id], unique: true
  end
end
