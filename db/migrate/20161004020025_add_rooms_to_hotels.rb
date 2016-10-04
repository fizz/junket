class AddRoomsToHotels < ActiveRecord::Migration[5.0]
  def change
    add_reference :hotels, :rooms, foreign_key: true
  end
end
