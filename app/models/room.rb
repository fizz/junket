# == Schema Information
#
# Table name: rooms
#
#  id             :integer          not null, primary key
#  room_type_id   :integer
#  hotel_id       :integer
#  number         :integer
#  price_in_cents :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_rooms_on_hotel_id      (hotel_id)
#  index_rooms_on_room_type_id  (room_type_id)
#
# Foreign Keys
#
#  fk_rails_cae2c0f55d  (hotel_id => hotels.id)
#  fk_rails_f4fff90e9d  (room_type_id => room_types.id)
#

class Room < ApplicationRecord
  belongs_to :room_type
  belongs_to :hotel
end
