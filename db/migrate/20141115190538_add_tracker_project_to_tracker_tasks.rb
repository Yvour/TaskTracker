class AddTrackerProjectToTrackerTasks < ActiveRecord::Migration
  def change
    add_reference :tracker_tasks, :tracker_project, index: true
  end
end
