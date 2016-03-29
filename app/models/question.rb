# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :text
#  text       :text
#  score      :integer
#  edited_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  belongs_to :user
  has_many :q_votes, :dependent => :destroy

  validates :user, :presence => true
  validates :title, :length => { :in => 6..50 }
  validates :text, :length => { :in => 6..5000 }
end
