class UserStoreController < ApplicationController

  def visit
    store_id = params["store_id"].to_i
    user_id = current_user.id
    store = UserStore.find_or_create_by(user_id: user_id, store_id: store_id)
    store["visited"] = !store["visited"]
    # allows us to visit and unvisit locations
    store.save
    render json:{visited:store }
  end

  def favorite
    store_id = params["store_id"].to_i
    user_id = current_user.id
    store = UserStore.find_or_create_by(user_id: user_id, store_id: store_id) 
    store["favorite"] = !store["favorite"]
    # allows us to favorite and unfavorite locations
    store.save
    render json:{favorite:store }
  end

end
