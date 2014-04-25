class User < ActiveRecord::Base
  has_one :authentication_token
  has_secure_password
  validates :email, uniqueness: true, presence: true
  attr_accessor :password_confirmation
end
