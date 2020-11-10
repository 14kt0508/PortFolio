class ContactTo < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :class_name, optional: true
	belongs_to :contact

end
