class TrackerUser < User
  
  has_many :initiated_tracker_tasks, class_name: 'TrackerTask', :foreign_key => 'initiator_id'
  has_many :gotten_tracker_tasks, class_name: 'TrackerTask', :foreign_key => 'user_id'
  
    def to_label
    #castle.castle_name
    "#{email}"
  end
  
  
  
end
