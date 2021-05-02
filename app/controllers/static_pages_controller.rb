class StaticPagesController < ApplicationController
  def home
    @user = User.new
    @letter = current_user.letters.build if logged_in?
  end

  def policy
  end

  def terms
  end
end
