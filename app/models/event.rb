class Event < ApplicationRecord

	belonsg_to :calendar
	belongs_to :event_class_name

end
