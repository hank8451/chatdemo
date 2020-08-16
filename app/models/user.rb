class User < ApplicationRecord
  validates :account, presence: true
  validates :password, presence: true
  has_many :channels
  has_many :messages

  before_create :encrypt_password

  def self.login(options)
    if options[:account] && options[:password]
      options[:password] = "a" + options[:password] + "z"
      find_by(account: options[:account], password: Digest::SHA1.hexdigest(options[:password]))
    end
  end

  private

  def encrypt_password
    self.password = add_some_salt(self.password)
  end

  def add_some_salt(password)
    password = "a" + password + "z"
    Digest::SHA1.hexdigest(password)
  end
end
