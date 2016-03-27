class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :user, :presence => true
  validates :title, :length => { :in => 6..50 }
  validates :text, :length => { :in => 6..5000 }
end
