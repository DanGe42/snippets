class Snippet < ActiveRecord::Base
  attr_accessible :code, :points, :title

  def increment_points (incr = 1)
    self.update_attributes(:points => self.points + incr)
  end

  def decrement_points (decr = 1)
    self.update_attributes(:points => self.points - 1)
  end
end
