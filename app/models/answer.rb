class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :user, :presence => true
  validates :text, :length => { :in => 6..5000 }
end
