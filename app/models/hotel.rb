# == Schema Information
#
# Table name: hotels
#
#  id                     :integer          not null, primary key
#  address_1              :string
#  address_2              :string
#  city                   :string
#  country                :string
#  created_at             :datetime         not null
#  description            :text
#  hotel_pic_content_type :string
#  hotel_pic_file_name    :string
#  hotel_pic_file_size    :integer
#  hotel_pic_updated_at   :datetime
#  name                   :string
#  region                 :string
#  updated_at             :datetime         not null
#  user_id                :integer
#  zip_code               :string
#  rooms_id               :integer
#
# Indexes
#
#  index_hotels_on_rooms_id  (rooms_id)
#  index_hotels_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_0b43c6c3aa  (user_id => users.id)
#  fk_rails_697aef536b  (rooms_id => rooms.id)
#

class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms
  validates_presence_of :name
  validates_presence_of :user_id
  has_attached_file :hotel_pic,
    styles: {small: '100x100#'},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :hotel_pic, content_type: /\Aimage\/.*\Z/
end
