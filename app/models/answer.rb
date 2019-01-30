class Answer < ApplicationRecord
	belongs_to :question

	validates :answer, presence: true, length: { maximum: 80 }
	validates :nickname, presence: true, length: { maximum: 20 }
end
