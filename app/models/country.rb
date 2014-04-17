class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  attr_accessible :name, :state_id

  validates :name, :state_id, presence: true

  belongs_to :state

  has_many :merchants
end
