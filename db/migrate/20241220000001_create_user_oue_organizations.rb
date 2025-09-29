class CreateUserOueOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_oue_organizations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :oue_organization, null: false, foreign_key: true

      t.timestamps
    end

    # Add unique index to prevent duplicate associations
    add_index :user_oue_organizations, [:user_id, :oue_organization_id], unique: true, name: 'index_user_oue_orgs_on_user_and_oue_org'
  end
end