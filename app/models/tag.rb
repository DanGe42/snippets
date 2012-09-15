class Tag < ActiveRecord::Base
  belongs_to :snippet
  attr_accessible :tag, :snippet_id
end
