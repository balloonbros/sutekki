class AddStatusToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :status, :integer, :null => false, :default => 0
  end
end
