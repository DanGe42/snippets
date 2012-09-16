class RenameTagstosnips < ActiveRecord::Migration
  def up
    rename_table :tagstosnips, :snippet_tags
  end

  def down
    rename_table :snippet_tags, :tagstosnips
  end
end
