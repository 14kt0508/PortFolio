class Event < ApplicationRecord

	# belonsg_to :calendar
	has_many :event_class_names

	validates :title, presence: true, length: {maximum: 50}
	validates :body, presence: true, length: {maximum: 200}


end
