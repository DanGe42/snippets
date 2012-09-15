class Snippet < ActiveRecord::Base
  belongs_to :tagstosnip
  attr_accessible :code, :points, :title
  has_many :tags
end
