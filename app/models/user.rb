class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
   end
  end

  def upvote (snippet)
    usv = UserSnippetVote.new(:user => self, :snippet => snippet,
                              :vote => UserSnippetVote::UPVOTE)

    if (usv.save)
      snippet.increment_points
      return true
    else
      prev_vote = UserSnippetVote.find(
        ["user_id = :user AND snippet_id => :snippet AND vote = :vote",
          { :user => self.id, :snippet => snippet.id, :vote => UserSnippetVote::DOWNVOTE }])

      # If the previous vote is a downvote
      if not prev_vote.nil?
        prev_vote.delete
        snippet.increment_points(2)
        usv.save!
        return true
      end
    end

    false
  end

  def downvote (snippet)
    usv = UserSnippetVote.new(:user => self, :snippet => snippet,
                              :vote => UserSnippetVote::DOWNVOTE)

    if (usv.save)
      snippet.decrement_points
      return true
    else
      prev_vote = UserSnippetVote.find(
        ["user_id = :user AND snippet_id => :snippet AND vote = :vote",
          { :user => self.id, :snippet => snippet.id, :vote => UserSnippetVote::DOWNVOTE }])

      # If the previous vote is a downvote
      if not prev_vote.nil?
        prev_vote.delete
        snippet.decrement_points(2)
        usv.save!
        return true
      end
    end

    false
  end

  def remove_vote (snippet)
    usv = UserSnippetVote.find(["user_id = :user AND snippet_id => :snippet",
                               { :user => self.id, :snippet => snippet.id }])

    return if usv.nil?

    if usv.vote == UserSnippetVote::UPVOTE
      snippet.decrement_points
    else
      snippet.increment_points
    end
  end

  private
  def change_vote (snippet)
  end
end
