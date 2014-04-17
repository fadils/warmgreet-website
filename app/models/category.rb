class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :tags

  has_many :merchants,
  through: :tags,
  source: :merchant

  include PgSearch
    multisearchable :against => [:name]

end
