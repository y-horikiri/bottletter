class LettersController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @letter = current_user.letters.build(letter_params_easy)
    if @letter.save
      flash[:success] = "レターを流しました。"
      redirect_to root_url
    else
      render "static_pages/home"
      
    end
  end

  def show
    @letter = Letter.find_by(id: params[:id])
  end

  def destroy
    # TODO: Ajax化
    @letter.destroy
    flash[:success] = "レターを削除しました。"
    redirect_to root_url
  end

  def random
    letter = Letter.find(Letter.pluck(:id).sample)
    redirect_to letter
  end

  private

    def letter_params
      params.require(:letter).permit(:content, :repliable, :twitter_attached, :reply_to)
    end

    def letter_params_easy
      params.require(:letter).permit(:content)
    end

    def correct_user
      @letter = current_user.letters.find_by(id: params[:id])
      redirect_to root_url if @letter.nil?
    end
end
