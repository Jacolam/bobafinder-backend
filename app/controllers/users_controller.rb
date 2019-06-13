class UsersController < ApplicationController

  def create
    User.create(user_params)

    is_valid = user.valid?

    if is_valid
      render json: { token: encode_token(user) }
    else
      render json:[1,2,3]
    end

  end

  def profile
    user = User.find(user_id)
    render json: user
  end

  private

  def user_params

    params.permit(:username, :password)
  end

end
