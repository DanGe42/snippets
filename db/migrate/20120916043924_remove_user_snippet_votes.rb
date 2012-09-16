class RemoveUserSnippetVotes < ActiveRecord::Migration
  def up
    drop_table :user_snippet_votes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
