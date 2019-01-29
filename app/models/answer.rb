class Answer < ApplicationRecord
	belongs_to :question

	validates :answer, presence: true, ength: { maximum: 80 }
	validates :nickname, presence: true, length: { maximum: 20 }
end
