# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :text
#  name            :text
#  email           :text
#  avatar          :text
#  link            :text
#  bio             :text
#  points          :integer
#  hide_state      :integer
#  admin           :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :q_votes

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
end
