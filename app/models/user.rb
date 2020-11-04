class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :children
	has_many :pick_up_persons

	validates :first_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/}
	validates :first_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/}
	validates :family_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/}
	validates :family_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/}
	validates :post_code, length: { in: 7..8 }
	validates :address, presence: true, format:{ with:/\A[ぁ-んァ-ン一-龥]/}
	validates :telephone, length: { in: 10..11 }

end
