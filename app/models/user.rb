class User < ApplicationRecord
  has_many :user_stores
  has_many :stores, through: :user_stores
  validates :username, uniqueness: { case_sensitive: false }
  has_secure_password

end
