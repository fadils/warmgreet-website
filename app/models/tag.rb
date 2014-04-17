class Tag < ActiveRecord::Base
  attr_accessible :merchant_id, :category_id

  validates :merchant_id, :category_id, presence: true
  validates :merchant_id, uniqueness: { scope: :category_id }

  belongs_to :merchant

  belongs_to :category
end
