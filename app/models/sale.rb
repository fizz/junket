# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  email      :string
#  guid       :string
#  product_id :integer
#  stripe_id  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sales_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_afd82832c8  (product_id => products.id)
#

class Sale < ApplicationRecord
  belongs_to :product
  has_secure_token :guid
end
