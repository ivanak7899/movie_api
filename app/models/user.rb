class User < ApplicationRecord
  has_secure_password
  
  has_many :reviews, dependent: :destroy
  has_many :sessions, dependent: :destroy
  
  ROLES = %w[user moderator admin].freeze
  
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: { case_sensitive: false }, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :role,     presence: true, inclusion: { in: ROLES }
end
  