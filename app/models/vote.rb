class Vote < ActiveRecord::Base
  UPVOTE = 1
  NO_VOTE = 0
  DOWNVOTE = -1

  belongs_to :user
  belongs_to :snippet
  attr_accessible :vote, :snippet, :user

  validates :user, :snippet, :vote, :presence => true
  validates :user_id, :uniqueness => { :scope => :snippet_id }
end
