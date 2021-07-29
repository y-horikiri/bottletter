class SessionsController < ApplicationController
  def create
    unless request.env["omniauth.auth"][:uid]
      flash[:danger] = "連携に失敗しました"
      redirect_to root_url
    end
    user_data = request.env["omniauth.auth"]
    user = User.find_by(twitter_id: user_data[:uid])
    if user
      log_in user
      flash[:success] = "ログインしました。"
    else
      new_user = User.new(
        twitter_id: user_data[:uid],
        name: user_data[:info][:nickname],
        image_url: user_data[:info][:image],
        authenticated: true
      )
      if new_user.save
        log_in new_user
        flash[:success] = "登録しました。"
      else
        flash[:danger] = "予期せぬエラーが発生しました。"
      end
    end
    redirect_to root_url
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
