class CreateRoomTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :room_types do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
