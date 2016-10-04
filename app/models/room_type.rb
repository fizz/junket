# == Schema Information
#
# Table name: room_types
#
#  id         :integer          not null, primary key
#  name       :string
#  capacity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomType < ApplicationRecord
end
