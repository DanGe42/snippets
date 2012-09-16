class RemoveSnippetFromTags < ActiveRecord::Migration
  def up
    remove_column :tags, :snippet_id
  end

  def down
    add_column :tags, :snippet_id, :integer
  end
end
