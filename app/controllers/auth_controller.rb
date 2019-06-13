class AuthController < ApplicationController

  def login
     #params :{username: '', password: ''}
     #find user
     #authenticate the username
     #log in
     user = User.find_by(username: params['username'])

     is_authenticated = user.authenticate(params['password'])

     # payload = { user_id: user.id}

    if is_authenticated
      render json: { token: encode_token(user) }
    else
      render json:[1,2,3]
    end

  end
end
