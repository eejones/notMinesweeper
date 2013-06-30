class User < ActiveRecord::Base
  attr_accessible :creation, :name, :password, :password_confirmation, :tottime, :type, :winner

  has_secure_password
  validates :name,  presence: true, uniqueness: true

  before_save :create_remember_token

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :games

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end
