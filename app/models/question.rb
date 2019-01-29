class Question < ApplicationRecord
	require 'securerandom'

	belongs_to :user
	has_many :answers, dependent: :destroy
	has_one_attached :question_image
	before_create :generate_token

	validates :question, presence: true, length: { maximum: 140 }
	validates :target, presence: true, length: { maximum: 12 }
	
  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
