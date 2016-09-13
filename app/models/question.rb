class Question < ActiveRecord::Base

  # validates :user_id, :presence => true
  validates :content, :presence => true
  has_many :answers

end
