# State machine
=begin
module StateMachine
  # Extensions for integrations of state machine
  module Integrations
    # ActiveModel extension that fixes the non-public around_validation error
    module ActiveModel
      send :public, :around_validation
    end
  end
end
=end

module StateMachine
  module Integrations
     module ActiveModel
        public :around_validation
     end

     module ActiveRecord
        public :around_save
     end
  end
end

module StateMachine::Integrations::ActiveModel
   public :around_validation
end