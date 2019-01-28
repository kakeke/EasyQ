class AnswersController < ApplicationController
	def create
		answer = Answer.new(answers_params)
		question = Question.find(answer.question_id)
		answer.ip = request.remote_ip
		if Answer.exists?(ip: answer.ip)
		   redirect_to question_path(question.token)
		   flash[:notice] = "既に回答済みのQです。"
		elsif answer.save
		   redirect_to question_path(question.token)
		else
		   redirect_to question_path(question.token)
		end
	end

	def update
	end

	def destroy
	end

	private
  	def answers_params
  		params.require(:answer).permit(:answer, :ip, :question_id)
  	end

  	def report_params
  		params.require(:answer).permit(:report)
  	end
end
