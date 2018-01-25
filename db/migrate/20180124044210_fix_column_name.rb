class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookings, :fee_porcentage, :fee_percentage
  end
end
