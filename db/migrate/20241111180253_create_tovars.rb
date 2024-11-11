class CreateTovars < ActiveRecord::Migration[7.2]
  def change
    create_table :tovars do |t|
      t.integer :length
      t.integer :width
      t.integer :height
      t.string :name
      t.string :weight
      t.string :price
      t.string :description
      t.string :image
      t.string :tags
      t.string :custom_data
      t.string :other_data

      t.timestamps
    end
  end
end
