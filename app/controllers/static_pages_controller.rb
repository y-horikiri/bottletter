class StaticPagesController < ApplicationController
  def home
    @user = User.new
    @letter = current_user.letters.build
  end

  def policy
  end

  def terms
  end
end
