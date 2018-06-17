class User < ApplicationRecord
  EMAIL_PATTERN = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password

  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_PATTERN }

  def email=(value)
    self[:email] = value&.downcase&.strip
  end
end
