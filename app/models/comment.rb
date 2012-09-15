class Comment < ActiveRecord::Base
  belongs_to :snippet
  attr_accessible :body, :title
end
