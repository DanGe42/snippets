class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.belongs_to :snippet

      t.timestamps
    end
    add_index :tags, :snippet_id
  end
end
