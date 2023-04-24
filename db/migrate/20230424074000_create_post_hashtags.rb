class CreatePostHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_hashtags do |t|
      t.references :post_id, index: true, foreign_key: true
      t.references :hashtag_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
