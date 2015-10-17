class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    authentication!
  end

  private

  def load_omniauth
    @user = User.find_for_oauth(request.env['omniauth.auth'])
  end

  def authentication!
    load_omniauth
    provider = request.env['omniauth.auth']['provider']
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}") if is_navigational_format?
    end
  end
end
