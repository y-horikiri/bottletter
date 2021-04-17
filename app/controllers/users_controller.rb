class UsersController < ApplicationController
  def create
    # 認証なし
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

  end
end
