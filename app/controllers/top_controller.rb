class TopController < ApplicationController
  def index
  	if current_user
  	   redirect_to user_path(current_user.id)
  	end
    @questions = Question.all
  end
end
