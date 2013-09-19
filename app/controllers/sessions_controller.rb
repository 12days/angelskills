class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])

    if @authorization
      render :text => "Welcome back #{@authorization.user.name}!"
    else
      # user = User.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]['email']
      # user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash['uid']
      # user.save
      render :text => 'create user logic pending'
      # render :text => 'Success! Welcome #{user.name}!'
    end
  end

  def failure
  end
end
