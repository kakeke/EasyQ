class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @question = Question.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	if user.update(user_params)
  	   redirect_to user_path(user.id)
  	else
  	   redirect_to edit_user_path(user.id)
  	end
  end

  def destroy
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :profile, :image)
  end

end