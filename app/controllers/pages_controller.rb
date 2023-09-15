class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  # Are these three even necessary?  Ayo.  Experiment around.
  def past
    @regretlist = Regretlist.where(user_id: current_user.id)
    @regrets = Regret.where(regretlist_id: params[:regretlist_id])
    @experiment = Experiment.where(user_id: current_user.id)
  end

  def present
    @badhabitlist = Badhabitlist.where(user_id: current_user.id)
    @badhabit = Badhabit.where(user_id: current_user.id)
    @currentlegacy = Currentlegacy.where(user_id: current_user.id)
    @currentlegacydisconnect = Currentlegacydisconnect.where(user_id: current_user.id)
  end

  def future
    @futureregretlist = Futureregretlist.where(user_id: current_user.id)
    @futureregret = Futureregret.where(user_id: current_user.id)
    @dreamlegacy = Dreamlegacy.where(user_id: current_user.id)
    @dreamlegacystep = Dreamlegacystep.where(user_id: current_user.id)
  end
end
