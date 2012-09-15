class UserSnippetVote < ActiveRecord::Base
  UPVOTE = true
  DOWNVOTE = false

  belongs_to :user
  belongs_to :snippet
  attr_accessible :user, :snippet, :vote

  validates :user, :snippet, :vote, :presence => true
  validates :user_id, :uniqueness => { :scope => :snippet_id }
end
