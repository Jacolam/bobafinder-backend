class AuthController < ApplicationController

  def login
     #find user
     user = User.find_by(username: params['username'])

     #authenticate the username
     is_authenticated = user.authenticate(params['password'])

     #log in
    if is_authenticated
      render json: { token: encode_token(user) }
    else
      # render json:{token: "Wrong username or password"}
    end

  end
end
