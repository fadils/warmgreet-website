class Follow < ActiveRecord::Base
  attr_accessible :follower_id, :followed_id

  validates :follower_id, :followed_id, presence: true
  validates :follower_id, uniqueness: { scope: :followed_id, message: "You already followed this shopper!" }

  belongs_to :follower,
  class_name: "User",
  foreign_key: :follower_id,
  primary_key: :id

  belongs_to :followed,
  class_name: "User",
  foreign_key: :followed_id,
  primary_key: :id

end
