class Question < ApplicationRecord
	belongs_to :user
	mount_uploader :question_image, QuestionImageUploader
end
