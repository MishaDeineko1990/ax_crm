class CreateOrganizations < ActiveRecord::Migration[7.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :short_name
      t.string :ederpou
      t.string :ipn
      t.string :type_rent
      t.string :factic_address
      t.string :legal_address
      t.string :send_adress
      t.string :number_count_bank
      t.string :mfo
      t.string :name_and_requisites_bank
      t.string :phone
      t.string :mail

      t.timestamps
    end
  end
end
