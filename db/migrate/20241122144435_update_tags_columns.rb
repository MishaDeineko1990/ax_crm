class UpdateTagsColumns < ActiveRecord::Migration[7.2]
  def change
    def change
      # Додавання нових стовпців
      add_column :tags, :t5, :string
      add_column :tags, :t6, :string
      add_column :tags, :t7, :string
  
      # Перейменування існуючих стовпців
      rename_column :tags, :l1, :t1
      rename_column :tags, :l2, :t2
      rename_column :tags, :l3, :t3
      rename_column :tags, :l4, :t4
    end
  end
end
