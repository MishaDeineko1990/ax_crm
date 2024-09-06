class CreatePerssons < ActiveRecord::Migration[7.2]
  def change
    create_table :perssons do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_nane
      t.string :name_for_contract
      t.string :phone
      t.string :email
      t.string :send_adress
      t.string :role
      t.date :birth_data
      t.string :note_data
      t.string :other_data

      t.timestamps
    end
  end
end
