class AddSaleToGoods < ActiveRecord::Migration[7.2]
  def change
    add_reference :goods, :sale, null: false, foreign_key: true
  end
end
