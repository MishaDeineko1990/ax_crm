class RenameFatherNaneToFatherNameInPerssons < ActiveRecord::Migration[7.2]
  def change
    rename_column :perssons, :father_nane, :father_name 
  end
end
