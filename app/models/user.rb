class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }
  validates :first_name, presence: true
  validates  :last_name, presence: true

  before_save do
    self.email.downcase! if self.email
    self.email.strip! if self.email
  end

  def self.authenticate_with_credentials(email, password)
    email2 = email.downcase.strip
    user = User.find_by_email(email2)
    if user
      user.authenticate(password)
    else
      nil
    end
  end
end
