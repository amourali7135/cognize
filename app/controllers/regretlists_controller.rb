class RegretlistsController < ApplicationController
  def new
    @regretlist = Regretlist.new
  end

  def create
    @regretlist = Regretlist.new(regret_list_params)
    @regretlist.user_id = current_user.id # Necessary?
    if @regretlist.save
      redirect_to future_futureregretlist_path(@regretlist)
    else
      flash[:error] = "There was an error, please try again"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @regretlist = Regretlist.find(params[:id])
  end

  private

  def regret_list_params
    params.require(:regretlist).permit(:user_id)
  end
end
