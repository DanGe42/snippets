class Snippet < ActiveRecord::Base
  belongs_to :tagstosnip, :user
  attr_accessible :code, :points, :title, :user_id
  has_many :tags

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
