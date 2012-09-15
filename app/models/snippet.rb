class Snippet < ActiveRecord::Base
  belongs_to :user

  validates :user, :code, :title, :presence => true

  attr_accessible :code, :title, :user, :points

  #after_create setup_snippet

  def increment_points (incr = 1)
    self.update_attributes(:points => self.points + incr)
  end

  def decrement_points (decr = 1)
    self.update_attributes(:points => self.points - decr)
  end

end
