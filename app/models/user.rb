class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :first_name, presence: true
  validates  :last_name, presence: true
  
  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
  end
end
