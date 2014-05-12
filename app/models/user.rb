class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  include BCrypt

  # has_secure_password
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return user if user && (user.password == password)
    nil
  end
end
