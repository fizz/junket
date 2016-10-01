class AddAttachmentHotelPicToHotels < ActiveRecord::Migration
  def self.up
    change_table :hotels do |t|
      t.attachment :hotel_pic
    end
  end

  def self.down
    remove_attachment :hotels, :hotel_pic
  end
end
