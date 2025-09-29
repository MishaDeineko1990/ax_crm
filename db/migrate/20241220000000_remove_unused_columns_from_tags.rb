class RemoveUnusedColumnsFromTags < ActiveRecord::Migration[7.0]
  def up
    # Видаляємо зайві поля t2, t3, t4, t5, t6, t7
    remove_column :tags, :t2, :string
    remove_column :tags, :t3, :string
    remove_column :tags, :t4, :string
    remove_column :tags, :t5, :string
    remove_column :tags, :t6, :string
    remove_column :tags, :t7, :string
  end

  def down
    # Для можливості rollback додаємо поля назад
    add_column :tags, :t2, :string
    add_column :tags, :t3, :string
    add_column :tags, :t4, :string
    add_column :tags, :t5, :string
    add_column :tags, :t6, :string
    add_column :tags, :t7, :string
  end
end