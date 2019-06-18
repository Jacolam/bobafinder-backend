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
<<<<<<< HEAD
    current_user.user_stores
    byebug
    render json: user
=======
    # FIND STORES SELECTED AS FAVORITE
    favorite_selected = current_user.user_stores.select { |store| store.favorite == true}

    # FIND STORE IDS FOR THE FAVORITE STORES
    store_ids = favorite_selected.map {|x| x.id}

    # RENDER FAVORITE STORE INFORMATION
    favorites = store_ids.map { |num| current_user.stores.find(num) }

    visited_selected = current_user.user_stores.select { |store| store.visited == true}
    store_ids = visited_selected.map {|x| x.id}
    visited = store_ids.map { |num| current_user.stores.find(num) }
    # byebug
    render json: {favorites: favorites, visited: visited}
>>>>>>> 4b6e254606bd5a42e7359bc5dcf4da8356457788
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
