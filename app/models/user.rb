class User < ApplicationRecord
  has many :stores through :user_stores
  validates :username, uniqueness: { case_sensitive: false }
  has_secure_password

end
