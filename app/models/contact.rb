class Contact < ApplicationRecord

	attachment :image
	belongs_to :admin
	has_many :contact_tos

	validates :title, presence: true, length: {maximum: 50}
	validates :body, presence: true, length: {maximum: 200}

end
