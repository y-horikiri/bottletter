class LettersController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @letter = current_user.letters.build(letter_params)
    if @micropost.save
      flash[:success] = 'Micropostが作成されました。'
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def show; end

  def destroy; end

  private

  def letter_params
    params.require(:letter).permit(:content, :repliable, :twitter_attached, :reply_to)
  end
end
