# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  permalink   :string
#  description :text
#  price       :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
  belongs_to :user
end
