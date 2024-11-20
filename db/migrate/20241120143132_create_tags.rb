class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :l1
      t.string :l2
      t.string :l3
      t.string :l4

      t.timestamps
    end
  end
end
