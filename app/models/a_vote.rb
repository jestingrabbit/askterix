class AVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  self.primary_key = 'key'

  validates :key, :presence => true
  validates :user_id, :presence => true
  validates :answer_id, :presence => true
end
