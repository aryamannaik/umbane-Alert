class LoadSchedule < ActiveRecord::Base
	validates :next_outage :allow_nil => true
end
