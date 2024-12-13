class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :t1
      t.string :t2
      t.string :t3
      t.string :t4
      t.string :t5
      t.string :t6
      t.string :t7

      t.timestamps
    end
  end
end
