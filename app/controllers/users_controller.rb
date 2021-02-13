class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
    @guides = @users.guides
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :age_id, :sex_id, :profession)
  end
end
