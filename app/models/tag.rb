class Tag < ActiveRecord::Base
  belongs_to :snippet, :tagstosnip
  attr_accessible :tag, :snippet_id
end
