class QuestionsController < ApplicationController
  include QuestionsHelper
  def index
    @user = User.find(params[:format])
  end


  def show
  	@question = Question.find_by(token: params[:token])
    @questions = Question.all
    @answer = Answer.new
    @user = User.find_by(id: @question.user.id)
  end

  def create
  	@question = Question.new(questions_params)
  	@question.user_id = current_user.id
  	@question.question_day = Date.today
  	if @question.save
       create_image(@question)
  	   redirect_to question_url(token: @question.token)
  	else
  	   redirect_to user_path(current_user.id)
  	end
  end


  def destroy
  	question = Question.find_by(token: params[:token])
    question.question_image.purge
    question.delete
    redirect_to user_path(current_user.id)
    flash[:notice] = "Qを削除しました。"
  end

  private
  	def questions_params
  		params.require(:question).permit(:target, :question, :question_day, :question_image, :user_id)
  	end
end
