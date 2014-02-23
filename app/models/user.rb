class User < ActiveRecord::Base

    def self.from_omniauth(auth)
      if auth
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.username = auth.info.name unless user.username?
          
          user.firstname = auth.info.first_name unless user.firstname?
          user.lastname = auth.info.last_name unless user.lastname?
          user.email = auth.info.email unless user.email?
          user.hometown = auth.info.location unless user.hometown?
          user.relationshipstatus = auth["extra"]["raw_info"]["relationship_status"] unless user.relationshipstatus?
          user.aboutme = auth['extra']['raw_info']['birthday']
          
          bday = auth['extra']['raw_info']['birthday']
          day = bday.slice(0,2)
          month = bday.slice(3,2)
          year = bday.slice(6,4)
          dob=Date.parse(day+'/'+day+'/'+year)
          now=Time.now.to_date
          user.age = (now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)).to_i #unless user.age?        
          


          
          
          user.oauth_token = auth.credentials.token
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save!
        end
      end
    end
  
=begin
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  VALID_USERNAME_REGEX = /[a-z0-9_-]\z/
  validates :username, presence: true, uniqueness: true, length: { maximum: 16 }, :format => { :with => VALID_USERNAME_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6}
  has_secure_password
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end



=end
end
