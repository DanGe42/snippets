class Snippet < ActiveRecord::Base

  attr_accessible :code, :points, :title, :user_id

  belongs_to :user
  has_many :tags
  has_many :tagstosnips

  validates :user, :code, :title, :presence => true

  after_create :setup_snippet

  def setup_snippet
    self.points = 0
    self.user.upvote_or_remove(self)
  end

  def increment_points (incr = 1)
    self.update_attributes(:points => self.points + incr)
  end

  def decrement_points (decr = 1)
    self.update_attributes(:points => self.points - decr)
  end

end
