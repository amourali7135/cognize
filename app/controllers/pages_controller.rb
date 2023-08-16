class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def past
    @regretlist = Regretlist.where(user_id: current_user.id)
    @regrets = Regret.where(regretlist_id: params[:regretlist_id])

  end

  def present

  end

  def future

  end

  
end
