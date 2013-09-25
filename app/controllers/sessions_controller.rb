class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)

      render :text => "Welcome back #{auth_hash.info.nickname}!"
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      session[:user_id] = auth.user
      render :text => "Welcome #{auth.user.name}!"
    end
  end

  def failure
    redirect_to root_url, alert: 'Sorry, we are unable to log you in! Please try again.'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'you are logged out'
  end

end
