class CreateLikeCommentUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :like_comment_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :like_comment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :like_comment_users, %i[user_id like_comment_id], unique: true
  end
end
