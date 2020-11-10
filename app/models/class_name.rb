class ClassName < ApplicationRecord

	has_many :event_classes
	has_many :children
	has_many :contact_tos

	validates :name, presence: true
end
