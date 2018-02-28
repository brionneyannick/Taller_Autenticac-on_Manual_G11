class User < ApplicationRecord
  has_many :histories

  attr_accessor :password, :password_confirmation
  validates :password, presence: true
  validates :password, confirmation: true
  before_save :bcrypt_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def bcrypt_password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate!(password_check)
    BCrypt::Password.new(self.password_digest) == password_check
  end
end
