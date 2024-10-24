class AddOrganizationIdToPerssons < ActiveRecord::Migration[7.2]
  def change
    add_column :perssons, :organization_id, :integer
  end
end
