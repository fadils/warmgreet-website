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
    #@merchant_reviews = self.
    #Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
    #SELECT clients.* FROM clients LEFT OUTER JOIN addresses ON addresses.client_id = clients.id

    #Review.joins('LEFT OUTER JOIN merchants ON merchants.client_id = reviews.id')
  end

  include PgSearch
    multisearchable :against => [:name]

end
