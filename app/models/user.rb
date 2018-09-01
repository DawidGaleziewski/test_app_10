class User < ApplicationRecord
  has_secure_password
  has_many :articles
  
  validates :username, presence: true, length: {minimum: 2, maximum: 10}, uniqueness: {case_sensitive: false}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 2, maximum: 20}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
end