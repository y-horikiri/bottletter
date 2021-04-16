class UsersController < ApplicationController
  def create
    # 認証なし
    @user = User.new(name: params[:user][:name], authenticated: false)
    if @user.save!
      # log_in @user
      redirect_to root_url
    else
      flash[:danger] = "登録失敗"
      redirect_to root_url

    end

  end

  def show

  end
end
