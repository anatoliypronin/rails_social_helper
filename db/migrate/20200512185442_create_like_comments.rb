class CreateLikeComments < ActiveRecord::Migration[6.0]
  def change
    create_table :like_comments do |t|
      t.boolean :value
      t.timestamps
    end
  end
end
