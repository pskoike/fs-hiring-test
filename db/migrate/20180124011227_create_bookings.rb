class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :amount_centavos
      t.integer :fee_porcentage
      t.string :booking_period
      t.string :booking_code
      t.datetime :paid_at
      t.references :motel, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
