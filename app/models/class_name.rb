class ClassName < ApplicationRecord

	has_many :event_classes
	has_many :children

	validates :name, presence: true
end
