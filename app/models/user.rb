class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :cars

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  
  #----------------------- validaciones para usuarios ----------------------
  validates_format_of :email, with: /\@unal.edu.co/, message: 'debe ser de la Universidad Nacional de Colombia.'
  validates_format_of :name, :career, without: /[0-9]+/, message: 'debe ser válido.'
  validates_uniqueness_of :nick, message: 'ya fue tomado.'
  validates :date_of_birth, :career, :name, :nick, presence: true
  #-------------------------------------------------------------------------

  before_create :confirmation_token
  after_create :welcome_email
  
  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
  
  #def self.new_with_session(params, session)
  #  super.tap do |user|
  #    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #      user.email = data["email"] if user.email.blank?
  #    end
  #  end
  #end
  
  #def self.from_omniauth(auth)
  #  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #    user.email = auth.info.email
  #    user.password = Devise.friendly_token[0,20]
  #    user.name = auth.info.name   # assuming the user model has a name
  #    user.nick = auth.info.nick
  #    user.date_of_birth =  Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')
  #    user.profile_image = auth.info.image
  #    # If you are using confirmable and the provider(s) you use validate emails, 
  #    # uncomment the line below to skip the confirmation emails.
  #    # user.skip_confirmation!
  #  end
  #end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
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

  ##### queries
  def self.profileImage(user_id)
    User.where(:id => user_id).uniq
  end
  
  def self.getName(user_id)
    User.find(user_id).name
  end
  
  def self.getEmail(user_id)
    User.find(user_id).email
  end
  
  def self.getNick(user_id)
    User.find(user_id).nick
  end
  
  def self.createdPerDay()
    User.group("DATE(created_at)").count
  end
  
  def self.countUsers()
    User.count
  end
  
  def self.createdPerDay2()
    User.where("DATE(created_at) = ?", Date.today-1).count
  end
  
  def self.countVehiclesUser(user)
    Car.where(:user_id => User.find_by_nick(user).id).size
  end
  
  def self.countRoutesUser(user)
    Route.where(:id_user => User.find_by_nick(user).id).size
  end
  
  def self.countPassengersUser(user)
    a = Route.where(:id_user => User.find_by_nick(user).id)
    count = 0
    if a.size > 0
      a.each do |b|
        count +=  b.users_in_route.split(", ").size
      end
    end
    count
  end
  
  def self.expensivePriceUser(user)
    a = Route.where(:id_user => User.find_by_nick(user).id)
    if a.size > 0
      price = 0
      a.each do |b|
        price = b.cost if b.cost > price
      end
      '%.0f' % price
    else
      "-"
    end
  end
  
  def self.cheapPriceUser(user)
    a = Route.where(:id_user => User.find_by_nick(user).id)
    if a.size > 0
      price = 10000000
      a.each do |b|
        price = b.cost if b.cost < price
      end
      '%.0f' % price
    else
      "-"
    end
  end
  
  def self.userCreatedAt(user)
    User.find_by_nick(user).created_at.strftime("%d-%m-%Y")
  end
  
  def self.countStars(user)
    allRoutes = Route.where(:id_user => User.find_by_nick(user).id)
    c1 = 0
    c2 = 0
    c3 = 0
    c4 = 0
    c5 = 0
    if allRoutes.size > 0
      allRoutes.each do |a|
         c1 += Route.countStars(a.id, 1)
         c2 += Route.countStars(a.id, 2)
         c3 += Route.countStars(a.id, 3)
         c4 += Route.countStars(a.id, 4)
         c5 += Route.countStars(a.id, 5)
      end
    end
    return [c1, c2, c3, c4, c5, c1 + c2 + c3 + c4 + c5]
  end
  
  def self.barWidths(stars)
    totalStars = stars[0].to_i + stars[1].to_i + stars[2].to_i + stars[3].to_i + stars[4].to_i
    if totalStars > 0
      w1 = stars[0]*100/totalStars
      w2 = stars[1]*100/totalStars
      w3 = stars[2]*100/totalStars
      w4 = stars[3]*100/totalStars
      w5 = stars[4]*100/totalStars
      return [w1, w2, w3, w4, w5]
    else
      return [0, 0, 0, 0, 0]
    end
  end
  
  def self.totalScore(stars)
    return '%.1f' % ((stars[0]*1.0 + stars[1]*2.0 + stars[2]*3.0 + stars[3]*4.0 + stars[4]*5.0)/stars[5])
  end
end
