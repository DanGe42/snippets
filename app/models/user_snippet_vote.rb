class UserSnippetVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet
  attr_accessible :vote
end
