class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :merchant_id

  validates :user_id, :merchant_id, presence: true
  validates :user_id, uniqueness: { scope: :merchant_id, message: "You already favorited that merchant!" }

  belongs_to :user

  belongs_to :merchant

end
