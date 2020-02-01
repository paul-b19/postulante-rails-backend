class User < ApplicationRecord
  has_many :collections
  has_many :requests, through: :collections

  validates :username, uniqueness: true

  has_secure_password
end
