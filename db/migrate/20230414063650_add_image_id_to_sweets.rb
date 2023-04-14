class AddImageIdToSweets < ActiveRecord::Migration[6.1]
  def change
    add_column :sweets, :image_id, :string
  end
end
