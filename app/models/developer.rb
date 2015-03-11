class Developer < ActiveRecord::Base
  has_many :time_entries

  has_secure_password

  before_save { self.email_address = email_address.downcase }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :developer_name, presence: true
  validates :email_address, presence: true, format: { with: EMAIL_REGEX },
      uniqueness: true, length: { minimum: 6 }
  validates :password, length: { minimum: 6 }

  def self.authenticate_developer(email, password)
    developer = find_by_email_address(email)
    if developer && developer.authenticate(password)
      developer
    else
      nil
    end
  end
end
