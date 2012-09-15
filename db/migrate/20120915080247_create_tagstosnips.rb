class CreateTagstosnips < ActiveRecord::Migration
  def change
    create_table :tagstosnips do |t|
      t.belongs_to :tag
      t.belongs_to :snippet

      t.timestamps
    end
    add_index :tagstosnips, :tag_id
    add_index :tagstosnips, :snippet_id
  end
end
