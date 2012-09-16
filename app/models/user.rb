class User < ActiveRecord::Base
  has_many :snippets
  has_many :votes
  has_many :comments

  validates :name, :presence => true
  attr_accessible :name, :provider, :uid
 
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
   end
  end

  def upvote_or_remove (snippet)
    prev_vote = Vote.where("user_id = ?", self.id)
                    .where("snippet_id = ?", snippet.id)
                    .first

    if prev_vote.nil?
      Vote.create(:user => self, :snippet => snippet, :vote => Vote::UPVOTE)
      snippet.increment_points

    else
      case prev_vote.vote
      when Vote::DOWNVOTE
        prev_vote.update_attributes(:vote => Vote::UPVOTE)
        snippet.increment_points(2)
      when Vote::UPVOTE
        Vote.delete(prev_vote.id)
        snippet.decrement_points(1)
      else
        raise ArgumentError.new
      end

    end
  end

  def downvote_or_remove (snippet)
    prev_vote = Vote.where("user_id = ?", self.id)
                    .where("snippet_id = ?", snippet.id)
                    .first

    if prev_vote.nil?
      Vote.create(:user => self, :snippet => snippet, :vote => Vote::DOWNVOTE)
      snippet.decrement_points

    else
      case prev_vote.vote
      when Vote::UPVOTE
        prev_vote.update_attributes(:vote => Vote::DOWNVOTE)
        snippet.decrement_points(2)
      when Vote::DOWNVOTE
        Vote.delete(prev_vote.id)
        snippet.increment_points(1)
      else
        raise ArgumentError.new
      end

    end
  end

end
