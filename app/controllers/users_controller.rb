class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @supplies = @user.supplies.all
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.update(params_user)
      redirect_to user_path(user.id)
    else
      render 'edit'
    end
  end

  private
  def params_user
    params.require(:user).permit(:first_name, :last_name, :user_image, :introduction)
  end

end
