class Tagstosnip < ActiveRecord::Base
  belongs_to :tag
  belongs_to :snippet
  # attr_accessible :title, :body
end
