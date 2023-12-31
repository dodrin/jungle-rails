class User < ApplicationRecord
  # Adds methods to set and authenticate against a BCrypt password
  has_secure_password
  
  # Verify that email field is not blank and that it doesn't already exist in the db
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 5}, confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end