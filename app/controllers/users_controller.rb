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
    current_user.user_stores
    byebug
    render json: user
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
