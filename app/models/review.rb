class Review < ActiveRecord::Base

  attr_accessible :title, :body, :pic, :pic_file_name, :rating, :user_id, :merchant_id

  validates :title, :body, :rating, :user_id, :merchant_id, presence: true
  #validates :merchant_id, uniqueness: { :scope => :user_id, :message => "You already wrote a review for this place!" }
  validates :title, length: { minimum: 15, maximum: 60, message: "title should be between 15 to 60 characters" }
  validates :body, length: { minimum: 25, message: "body too short! Give more detail, people will love it" }

  has_attached_file :pic, 
                :styles => {
                  :big => "500x300!",
                  :small => "60x60#"
                }

  belongs_to :merchant

  belongs_to :user

  has_many :vote_tags

  has_many :users_who_voted,
  through: :vote_tags,
  source: :user

  
  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM follows
                         WHERE follower_id = :user_id"
                         where("user_id IN (#{followed_user_ids})",
     
    #where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

end
