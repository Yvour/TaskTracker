class AddStateToTrackerTask < ActiveRecord::Migration
  def change
    add_column :tracker_tasks, :state, :string
  end
end
