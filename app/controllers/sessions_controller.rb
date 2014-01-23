class SessionsController < ApplicationController

  def new
    @client = LinkedIn::Client.new(ENV["LINKEDIN_API_KEY"], ENV["LINKEDIN_API_SECRET"])
    request_token = @client.request_token(:oauth_callback => "http://#{request.host_with_port}/auth/linkedin/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to @client.request_token.authorize_url

  end

  def create
    @client = LinkedIn::Client.new(ENV["LINKEDIN_API_KEY"], ENV["LINKEDIN_API_SECRET"])
    request_token = @client.request_token(:oauth_callback => "http://#{request.host_with_port}/auth/linkedin/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to @client.request_token.authorize_url

    # auth_hash = request.env['omniauth.auth']
    # if session[:user_id]
    #   User.find(session[:user_id]).add_provider(auth_hash)
    # else
    #   auth = Authorization.find_or_create(auth_hash)
    #   session[:user_id] = auth.user.id
    # end

    # redirect_to root_path
  end

  def failure
    redirect_to root_url, alert: 'Sorry, we are unable to log you in! Please try again.'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'you are logged out'
  end

end
