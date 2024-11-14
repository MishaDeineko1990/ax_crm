class RenameSendAddressToSendAdressInOueOrganizations < ActiveRecord::Migration[7.2]
  def change
    rename_column :oue_organizations, :send_adress, :send_adress
  end
end
