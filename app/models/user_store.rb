class UserStore < ApplicationRecord
  belongs_to :user
  belongs_to :store
# unable to call User.UserStore , schema not working properly


end
