class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :code
      t.integer :points

      t.timestamps
    end
  end
end
