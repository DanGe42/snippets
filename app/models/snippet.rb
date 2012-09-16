class Snippet < ActiveRecord::Base
  belongs_to :user

  attr_accessible :code, :points, :title, :description, :user_id, :snippet_id, :all_tags
  has_many :comments
  has_many :tags
  has_many :snippet_tags

  validates :user, :code, :title, :description, :presence => true

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

  def all_tags=(tag_input)
    tags = tag_input.split(/\s*\,\s*/)
    valid_tag = /[a-zA-Z0-9_\+\-\']+/
    tags.each do |tag_name|
      # validate each tag, and reject if they're not all (\w|-)+
      if (valid_tag =~ tag_name)
        tag_name.downcase!
        tag = Tag.find_or_create_by_tag(tag_name)
        SnippetTag.create(:tag => tag, :snippet => self)
      end
    end
  end

  def all_tags
    snippet_tags = SnippetTag.where(:snippet_id => self.id)
    tags = snippet_tags.map { |st| Tag.find(st.tag_id) }

    tags
  end
end
