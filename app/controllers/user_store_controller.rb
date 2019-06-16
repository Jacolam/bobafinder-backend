class UserStoreController < ApplicationController

  def visit
    store_id = params["store_id"].to_i
    user_id = current_user.id
    new = UserStore.find_or_create_by(user_id: user_id, store_id: store_id)
    new["visited"] = !new["visited"]
    # allows us to visit and unvisit locations 
    new.save
    render json:{visited:new }
  end

end
