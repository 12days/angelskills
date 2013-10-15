class SessionsController < ApplicationController
  def new
    client = LinkedIn::Client.new(ENV["LINKEDIN_API_KEY"], ENV["LINKEDIN_API_SECRET"])
    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/skills/")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url
  end

  def create
    auth_hash = request.env['omniauth.auth']
    # @user = User.find_or_create(auth_hash)

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
