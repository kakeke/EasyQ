class QuestionsController < ApplicationController
  include QuestionsHelper

  def show
  	@question = Question.find(params[:id])
  end

  def create
  	@question = Question.new(questions_params)
  	@question.user_id = current_user.id
  	@question.question_day = Date.today
  	if @question.save
       create_image(@question)
  	   redirect_to question_path(@question.id)
  	else
       puts '--------------------------------'
       @question.errors.full_messages
       puts '--------------------------------'
  	   redirect_to user_path(current_user.id)
  	end
  end


  def destroy
  	
  end

  private
  	def questions_params
  		params.require(:question).permit(:target, :question, :question_day, :user_id)
  	end
end
