class Store < ApplicationRecord
  has many :users through :user_stores

end
