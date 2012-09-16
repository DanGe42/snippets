class Snippet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :points, :title, :description, :user_id, :viewtype
  has_many :tags
  has_many :snippet_tags

  validates :user, :code, :title, :presence => true

  after_create :setup_snippet

  def setup_snippet
    self.points = 0
    self.user.upvote_or_remove(self)
    self.viewtype = "recent"
  end

  def increment_points (incr = 1)
    self.update_attributes(:points => self.points + incr)
  end

  def decrement_points (decr = 1)
    self.update_attributes(:points => self.points - decr)
  end
end
