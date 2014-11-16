class TrackerTask < ActiveRecord::Base
  acts_as_taggable
  belongs_to :initiator, class_name: 'TrackerUser'
  belongs_to :user, class_name: 'TrackerUser'
  belongs_to :tracker_project, class_name: 'TrackerProject'

  validates_presence_of :user
  validates_presence_of :initiator
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :cost
  validates_presence_of :tracker_project

  state_machine :state, :initial => :initialized do
    event :accept do
      transition :initialized => :accepted
    end
    event :verify do
      transition :accepted => :verified
    end
    event :start_process do
      transition :verified => :in_process
    end
    event :finish_process do
      transition :in_process => :in_test
    end
    event :test_passed do
      transition :in_test => :executed
    end    
    
        
    
  end

end
