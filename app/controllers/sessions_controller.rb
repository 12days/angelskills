class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)

      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
<<<<<<< HEAD
      # user = User.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]['email']
      # user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash['uid']
      # user.save
      render :text => 'Success! Welcome #{user.name}!'
=======
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      session[:user_id] = auth.user
      render :text => "Welcome #{auth.user.name}!"
>>>>>>> sessions
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
