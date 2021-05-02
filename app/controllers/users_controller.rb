class UsersController < ApplicationController
  def create
    # かんたんログイン
    @user = User.new(name: params[:user][:name])
    if @user.save
      log_in @user
      flash[:success] = "登録しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "登録に失敗しました。もう一度お試しください。"
      render "/static_pages/home"
    end

  end

  def show
    @user = User.find_by(id: params[:id])
    @letters = @user.letters.paginate(page: params[:page])
  end
end
