class AddUserIdToPerssons < ActiveRecord::Migration[7.2]
  def change
    add_column :perssons, :user_id, :integer
    add_index :perssons, :user_id
  end
end
