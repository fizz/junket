class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :region
      t.string :zip_code
      t.string :country
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
