class UserStoreController < ApplicationController

  def visit
    store_id = params["store_id"].to_i
    user_id = current_user.id
    new = UserStore.find_or_create_by(user_id: user_id, store_id: store_id, visited: true )
    render json:{visited:new }
  end

end
