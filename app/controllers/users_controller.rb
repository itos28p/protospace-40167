class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user
      @prototypes = @user.prototypes
    else
      flash[:alert] = "指定されたユーザーは存在しません。"
      redirect_to root_path
    end
  end
end