

class ApplicationController < ActionController::API

  # def welcome
  #   @all = Store.all
  #   render json: {stores:@all}  #
  # end

  def user_payload(user)
    {user_id: user.id}
  end


  def encode_token(user)
    JWT.encode(user_payload(user),'salt_bae', 'HS256')
  end


end
