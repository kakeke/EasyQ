class QuestionsController < ApplicationController
  def show
  	@question = Question.find(params[:id])
  end

  def create
  	question = Question.new(questions_params)
  	img = QuestionsHelper.build(question.question)
  	question.question_image_id = img.tempfile.open.read
  	question.user_id = current_user.id
  	question.question_day = Date.today
  	if question.save
  	   redirect_to question_path(question.id)
  	else
  	   redirect_to users_path(current_user.id)
  	end
  end

  def destroy
  	
  end

  private
  	def questions_params
  		params.require(:question).permit(:target, :question, :question_image_id, :question_day, :user_id)
  	end
end
