class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
end
