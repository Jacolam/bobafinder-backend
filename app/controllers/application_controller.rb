class ApplicationController < ActionController::API

  def user_payload(user)
    {user_id: user.id}
  end

  def encode_token(user)
    JWT.encode(user_payload(user),'salt_bae', 'HS256')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    token = auth_header

    JWT.decode(token, 'salt_bae', true, algorithm: 'HS256')
  
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
