class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :title
      t.boolean :published

      t.timestamps null: false
    end
  end
end
