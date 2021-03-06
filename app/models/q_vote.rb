class QVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  self.primary_key = 'key'

  validates :key, :presence => true
  validates :user_id, :presence => true
  validates :question_id, :presence => true
end
