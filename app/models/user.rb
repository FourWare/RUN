class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :cars
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates_format_of :email, with: /\@unal.edu.co/, message: 'debe ser de la Universidad Nacional de Colombia.'
  validates_uniqueness_of :nick

  before_create :confirmation_token
  after_create :welcome_email
  
  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.nick = auth.info.nick
      user.date_of_birth =  Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')
      user.profile_image = auth.info.image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  
  private
  
  def confirmation_token 
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
    UserMailer.registration_confirmation(self).deliver_now
  end
  
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
end
