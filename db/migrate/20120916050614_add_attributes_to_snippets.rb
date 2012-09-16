class AddAttributesToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :viewtype, :string
  end
end
