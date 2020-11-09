class Event < ApplicationRecord

	has_many :event_class_names
	has_many :class_names, through: :event_class_names

	validates :title, presence: true, length: {maximum: 50}
	validates :body, presence: true, length: {maximum: 200}


end
