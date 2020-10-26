class PicUpPerson < ApplicationRecord

	belongs_to :user

	validates :first_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/}
	validates :first_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/}
	validates :family_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/}
	validates :family_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/}
	validates :birth_date, presence: true
	validates :post_code, length: { in: 7..8 }
  	validates :address, presence: true, format:{ with:/\A[ぁ-んァ-ン一-龥]/}
  	validates :telephone, length: { in: 10..11 }
  	validates :relationship,length: {minimum: 1, maximum:15}


end
