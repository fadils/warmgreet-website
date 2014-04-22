class Merchant < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  attr_accessible :name, :website, :phone, :country_id, :category_ids, :photo

  validates :name, :country_id, presence: true

  validates :name, uniqueness: {:scope => :website, :message => "Merchant already exists!"}

  has_attached_file :photo, :styles => {
    :big => "250x250>",
    :medium => "100x100#",
    :small => "60x60#"
  }

  paginates_per 5

  include PgSearch
    multisearchable :against => [:name]

  has_one :customer

  has_many :tags

  has_many :categories,
  through: :tags,
  source: :category,
  dependent: :destroy

  has_many :reviews,
  dependent: :destroy

  has_many :reviewers,
  through: :reviews,
  source: :user

  belongs_to :country

  has_many :favorites,
  dependent: :destroy

  has_many :users_who_favorited,
  through: :favorites,
  source: :user

  def average_rating
    total = 0
    count = self.reviews.count

    if count == 0
      return 0
    else
      self.reviews.each do |review|
        total += review.rating
      end

      return (total.to_f / count).round(1)
    end
  end

end
