class CreateUserSnippetVotes < ActiveRecord::Migration
  def change
    create_table :user_snippet_votes do |t|
      t.belongs_to :user
      t.belongs_to :snippet
      t.boolean :vote

      t.timestamps
    end
    add_index :user_snippet_votes, :user_id
    add_index :user_snippet_votes, :snippet_id
  end
end
