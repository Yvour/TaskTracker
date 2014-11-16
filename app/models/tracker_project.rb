class TrackerProject < ActiveRecord::Base
  has_many :tracker_tasks
  
      def to_label

    "#{name}"
  end
end
