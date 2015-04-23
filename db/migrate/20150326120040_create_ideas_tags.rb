class CreateIdeasTags < ActiveRecord::Migration
  def change
    create_table :ideas_tags do |t|
      t.integer :idea_id
      t.integer :tag_id
      t.boolean :published

      t.timestamps null: false
    end
  end
end
