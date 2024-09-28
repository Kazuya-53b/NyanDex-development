class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update_username
    @user = User.find(params[:id])

    if @user.update(user_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("user-info-container", partial: "users/edit_username", locals: { user: @user })
        end
        format.html { redirect_to @user, notice: "ユーザー名が更新されました。" }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("user-info-container", partial: "users/edit_username", locals: { user: @user })
        end
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
