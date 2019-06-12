class Store < ApplicationRecord
  has_many :users, through: :user_stores

end
