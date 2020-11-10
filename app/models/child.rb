class Child < ApplicationRecord

	belongs_to :user
	belongs_to :class_name

	validates :first_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/}
	validates :first_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/}
	validates :family_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/}
	validates :family_name_kana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/}
	validates :birth_date, presence: true
	validates :pick_up_person, presence: true
  	validates :pick_up_time, presence: true
  	validates :allergies, presence: true
  	validates :remarks, presence: true


end
