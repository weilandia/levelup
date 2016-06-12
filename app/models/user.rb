class User < ActiveRecord::Base
  has_many :authorizations
  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    roles.exists?(name:"admin")
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s, token: auth.credentials.token).first_or_initialize

    if authorization.user.blank?
      user = current_user || User.where(email: auth["info"]["email"]).first
      if user.blank?
       user = User.new
       user.email = auth.info.email
       user.name = auth.info.name
       user.image_url = auth.info.image
       user.save
      end
      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save
    end
    authorization.user
  end
end
