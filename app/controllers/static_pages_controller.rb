class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def policy
  end

  def terms
  end
end
