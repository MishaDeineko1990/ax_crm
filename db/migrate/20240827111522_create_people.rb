class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :phone_number
      t.string :email
      t.date :birth_data_time
      t.string :note_data
      t.string :other_data
      t.string :position
      t.string :sex

      t.timestamps
    end
  end
end
