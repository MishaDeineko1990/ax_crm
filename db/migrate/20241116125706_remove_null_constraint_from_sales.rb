
class RemoveNullConstraintFromSales < ActiveRecord::Migration[7.2]
  def change
    change_column_null :sales, :organization_id, true
    change_column_null :sales, :oue_organization_id, true
    change_column_null :sales, :persson_id, true
  end
end