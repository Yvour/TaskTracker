class CreateTrackerProjects < ActiveRecord::Migration
  def change
    create_table :tracker_projects do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
