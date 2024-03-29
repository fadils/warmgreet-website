class Customer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, :use => :slugged

  attr_accessible :email, :password, :merchant_number, :session_token, :photo, :uid, :provider, :image, :auth_token, :activated
  attr_reader :password

  before_validation :ensure_session_token
  before_validation(:ensure_auth_token, on: :create)

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, :allow_nil => true }
  validates :password_digest, presence: true
  validates :email, uniqueness: true

  has_attached_file :photo, :styles => {
    :big => "100x100#",
    :small => "60x60#",
    :bucket => 'nil'
  }

  has_one :merchant

  has_many :posts,
  dependent: :destroy

  has_many :favorited_by,
  dependent: :destroy

  #not yet modified
  def feed
    Review.from_users_followed_by(self)
  end

  def self.find_uid_or_create(auth)

    customer = Customer.find_by_uid(auth[:uid])

    unless customer
      if auth[:provider] == 'facebook'
        customer = Customer.create!(
                 uid: auth[:uid],
                 provider: auth[:provider],
                 username: (auth[:info][:nickname] || auth[:info][:first_name]+rand(1..1000).to_s),
                 email: auth[:info][:email],
                 image: auth[:info][:image] + "?type=large",
                 password: SecureRandom::urlsafe_base64(16)
               )
      elsif auth[:provider] == 'twitter'
        customer = Customer.create!(
                 uid: auth[:uid],
                 provider: auth[:provider],
                 username: auth[:info][:nickname],
                 email: "fillmein@right.meow",
                 image: auth[:info][:image].gsub("_normal", ""),
                 password: SecureRandom::urlsafe_base64(16)
               )
      else
        #asdf
      end
    end

    return customer
  end


  def self.find_by_credentials(username, merchant_number, password)
    customer = (Customer.find_by_username(username) || Customer.find_by_email(username) && Customer.find_by_merchant_number(merchant_number))
    customer.try(:is_password?, password) ? customer : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def activate!
    self.activated = true
    self.save
  end

  def generate_password
    #generated_password = Devise.friendly_token.first(8)
    self.password = "@021103F"
    #self.password_confirmation = generated_password
  end

  def generate_merchant_number(merchant_number)
    self.merchant_number = merchant_number
    #self.password_confirmation = generated_password
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def ensure_auth_token
    self.auth_token ||= self.class.generate_session_token
  end

end