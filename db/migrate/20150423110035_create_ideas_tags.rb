class CreateIdeasTags < ActiveRecord::Migration
  def change
    create_table :ideas_tags do |t|
      t.belongs_to :idea, index: true
      t.belongs_to :tag, index: true

      t.timestamps null: false
    end
  end
end
