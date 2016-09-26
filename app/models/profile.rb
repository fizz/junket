# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  bio        :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_e424190865  (user_id => users.id)
#

class Profile < ApplicationRecord
  validates_presence_of :bio
  validates_presence_of :user_id
  belongs_to :user
end
