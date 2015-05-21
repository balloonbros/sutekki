class CreateIdeaJoinTable < ActiveRecord::Migration
  def change
    create_join_table :ideas, :labels do |t|
      # t.index [:idea_id, :label_id]
      t.index [:label_id, :idea_id], unique: true
    end
  end
end
