class Question < ApplicationRecord
	require 'securerandom'

	belongs_to :user
	has_one_attached :question_image
	before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
