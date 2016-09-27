# == Schema Information
#
# Table name: profiles
#
#  id                       :integer          not null, primary key
#  bio                      :text
#  user_id                  :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  profile_pic_file_name    :string
#  profile_pic_content_type :string
#  profile_pic_file_size    :integer
#  profile_pic_updated_at   :datetime
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
  has_attached_file :profile_pic,
    styles: {small: '100x100#'},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
end
