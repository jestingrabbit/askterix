# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  text        :text
#  score       :integer
#  edited_at   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :user, :presence => true
  validates :text, :length => { :in => 6..5000 }
end
