class CreateJoinTableTagsTovars < ActiveRecord::Migration[7.2]
  def change
    create_join_table :tags, :tovars do |t|
      # t.index [:tag_id, :tovar_id]
      # t.index [:tovar_id, :tag_id]
    end
  end
end
