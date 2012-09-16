class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet
  attr_accessible :content, :user, :snippet, :user_id, :snippet_id
  
  validates :user, :snippet, :content, :presence => true
  validates :content, :length => {:minimum => 1, :maximum => 500}
  
  def commenter
    User.find(self.user_id)
  end
  
end