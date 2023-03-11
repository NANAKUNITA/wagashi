class CreateSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets do |t|
      t.integer :tag_id
      t.string :name
      t.text :description
      t.string :image_id
      t.timestamps
    end
  end
end
