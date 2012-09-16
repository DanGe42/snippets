class Tag < ActiveRecord::Base
  has_many :snippets
  has_many :snippet_tags
  attr_accessible :tag
end
