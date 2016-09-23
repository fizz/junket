# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string
#  permalink         :string
#  description       :text
#  price             :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_dee2631783  (user_id => users.id)
#

class Product < ApplicationRecord
  has_attached_file :file
  belongs_to :user
end
