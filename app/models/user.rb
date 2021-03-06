class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  after_create :send_welcome_message

  def send_welcome_message
    StackMailer.new_user_confirmation(self).deliver_now
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
  user = User.where(email: email).first
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end

  end

end
