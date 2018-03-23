class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_one :topic
  has_secure_password

  validates :email, uniqueness: true
  validates :name, presence: true

  def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     name: auth_hash["info"]["name"],
     email: auth_hash["info"]["email"],
     password: 'google'
   )
   user.authentications << authentication
   return user
  end

   # grab google to access google for user data
   def google_token
     x = self.authentications.find_by(provider: 'google_oauth2')
     return x.token unless x.nil?
   end

end
