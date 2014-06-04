class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :tags

  has_many :merchants,
  through: :tags,
  source: :merchant

  def feeds
    Review.all
  end

  include PgSearch
    multisearchable :against => [:name]

end
