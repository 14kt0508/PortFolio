class Facility < ApplicationRecord

	has_many :admins

	validates :facility_name, presence: true, length: {maximum: 30, minimum: 2}

end
