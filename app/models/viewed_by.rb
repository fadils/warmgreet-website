class ViewedBy < ActiveRecord::Base
  attr_accessible :viewed_id, :user_viewing_id, :user_viewed_id

  validates :viewed_id, :user_viewing_id, :user_viewed_id, presence: true

  belongs_to :user
end

