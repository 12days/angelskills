class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    auth = request.env["omniauth.auth"]
    @user = User.find_for_linkedin_oauth(auth, current_user)
    create_account(auth, 'linkedin', @user.id)

    if @user.persisted?
      flash[:notice] = I18n.t "authenticated", :kind => "Linkedin"
      if @user.confirmation_sent_at.nil?
        redirect_to root_path
      else
        sign_in_and_redirect @user, :event => :authentication
      end
    else
      session['devise.linkedin_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end

private

  def create_account(auth, provider, user_id)
    account = Account.where(user_id: user_id, provider: provider).first_or_create
    account.update_attributes(access_token: auth.credentials.token, access_secret: auth.credentials.secret, uid: auth.uid, email: auth.extra.raw_info.email)
    account
  end

end
