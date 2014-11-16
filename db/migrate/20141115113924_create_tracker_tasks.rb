class CreateTrackerTasks < ActiveRecord::Migration
  def change
    create_table :tracker_tasks do |t|
      t.float :cost
      t.string :title
      t.text :description
      t.integer :initiator_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
