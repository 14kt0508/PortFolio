class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :facility

	has_many :contacts, dependent: :destroy

	# validates :facility_name, presence: true, length: {maximum: 30, minimum: 2}

end
