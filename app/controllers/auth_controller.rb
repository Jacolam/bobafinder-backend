class AuthController < ApplicationController

  def login
     #params :{username: '', password: ''}
     
     #find user
     user = User.find_by(username: params['username'])

     #authenticate the username
     is_authenticated = user.authenticate(params['password'])

     # payload = { user_id: user.id}

     #log in
    if is_authenticated
      render json: { token: encode_token(user) }
    else
      render json:{error: "Wrong username or password"}
    end

  end
end
