class AnswersController < ApplicationController
	def create
		answer = Answer.new(answers_params)
		question = Question.find(answer.question_id)
		if answer.save
		   redirect_to question_path(question.token)
		else
		   redirect_to question_path(question.token)
		end
	end

	def destroy
	end

	private
  	def answers_params
  		params.require(:answer).permit(:answer, :question_id)
  	end
end
