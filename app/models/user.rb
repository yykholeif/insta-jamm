class User < ApplicationRecord
  has_many :subscriptions
  has_many :channels, through: :subscriptions
  # Remember to create a migration!
  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    @user = self.find_by(email: email)
    if @user && @user.password == password
      return @user
    else
      nil
    end
  end


end
