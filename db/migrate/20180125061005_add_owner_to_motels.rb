class AddOwnerToMotels < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :motel, foreign_key: true
  end
end
