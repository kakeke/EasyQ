class AnswersController < ApplicationController
	def create
		answer = Answer.new(answers_params)
		question = Question.find(answer.question_id)
		answer.ip = request.remote_ip
		if Answer.exists?(ip: answer.ip, question_id: answer.question_id)
		   redirect_to question_path(question.token)
		   flash[:notice] = "既に回答済みのQです。"
		elsif answer.save
		   redirect_to question_path(question.token)
		else
		   redirect_to question_path(question.token)
		   flash[:notice] = "何らかの問題で回答できませんでした。記入内容を確認してください。"
		end
	end

	def update
	end

	def destroy
	end

	private
  	def answers_params
  		params.require(:answer).permit(:nickname, :answer, :ip, :question_id)
  	end
end
