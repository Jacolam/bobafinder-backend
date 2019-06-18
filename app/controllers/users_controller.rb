class UsersController < ApplicationController

  def create
    user = User.create(user_params)

    is_valid = user.valid?
    if is_valid
      render json: { token: encode_token(user) }
    else
      render json:{error: "Invalid username or password"}
    end

  end

  def profile
    # FIND STORES SELECTED AS FAVORITE
    favorite_selected = current_user.user_stores.select { |store| store.favorite == true}

    # FIND STORE IDS FOR THE FAVORITE STORES
    fav_ids = favorite_selected.map{ |fav| fav.store_id}

    # RENDER FAVORITE STORE INFORMATION
    favorites = fav_ids.map { |num| current_user.stores.find_by(id: num) }

    visited_selected = current_user.user_stores.select { |store| store.visited == true}

    visit_ids = visited_selected.map {|x| x.store_id}

    visited = visit_ids.map { |num| current_user.stores.find_by(id: num) }
    render json: {favorites: favorites, visited: visited, username:current_user.username}
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
