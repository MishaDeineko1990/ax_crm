class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.integer :status
      t.string :note
      t.string :other_data
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.references :oue_organization, null: false, foreign_key: true
      t.references :persson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
