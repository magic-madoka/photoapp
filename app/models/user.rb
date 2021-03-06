class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :authorizations
  has_many :attachments

  # class self
  class << self
    def find_for_oauth auth
      authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s).first
      return authorization.user if authorization

      email = auth.info[:email]
      name  = auth.info[:first_name]
      last  = auth.info[:last_name]
      user  = User.where(email: email).first
      if user
        user.authorizations.create(provider: auth.provider, uid: auth.uid)
      else
        password = Devise.friendly_token[0, 20]
        user     = User.create!(email: email, password: password, password_confirmation: password, name: name, last_name: last)
        user.authorizations.create(provider: auth.provider, uid: auth.uid)
      end
      user
    end
  end
  #end
end
