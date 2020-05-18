class CreateCommentLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_likes do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :like_comment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comment_likes, %i[comment_id like_comment_id], unique: true
  end
end
