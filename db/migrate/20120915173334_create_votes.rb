class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :snippet
      t.integer :vote

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :snippet_id
  end
end
