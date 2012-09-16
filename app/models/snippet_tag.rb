class SnippetTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :snippet

  attr_accessible :tag, :snippet

  validates :tag, :snippet, :presence => true
  validates :tag_id, :uniqueness => { :scope => :snippet_id }
end
