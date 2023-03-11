class CreateSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets do |t|

      t.timestamps
    end
  end
end
