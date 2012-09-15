class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.belongs_to :snippet

      t.timestamps
    end
    add_index :comments, :snippet_id
  end
end
