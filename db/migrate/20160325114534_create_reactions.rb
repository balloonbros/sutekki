class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :user_id
      t.integer :idea_id
      t.string :action

      t.timestamps null: false
    end
    add_index :reactions, :user_id
    add_index :reactions, :idea_id
  end
end
