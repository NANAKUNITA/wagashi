class CreateSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets do |t|
      t.string :name
      t.integer :month
      t.text :description

      t.timestamps
    end
  end
end
