class LettersController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @letter = current_user.letters.build(letter_params)
    if @letter.save
      flash[:success] = 'レターを流しました。'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
    @letter = Letter.find_by(id: params[:id]) 
  end

  def destroy
    @letter.destroy
    flash[:success] = "レターを削除しました。"
    redirect_to root_url
  end

  private

    def letter_params
      params.require(:letter).permit(:content, :repliable, :twitter_attached, :reply_to)
    end

    def correct_user
      @letter = current_user.letters.find_by(id: params[:id])
      redirect_to root_url if @letter.nil?
    end
end
