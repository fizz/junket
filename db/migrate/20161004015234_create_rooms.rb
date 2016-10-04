class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.references :room_type, foreign_key: true
      t.references :hotel, foreign_key: true
      t.integer :number
      t.integer :price_in_cents
      t.string :name

      t.timestamps
    end
  end
end
