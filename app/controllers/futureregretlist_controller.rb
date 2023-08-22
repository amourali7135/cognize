class FutureregretlistController < ApplicationController
  def new
    @futureregretlist = Futureregretlist.new
  end

  def create
    @futureregretlist = Futureregretlist.new(future_regret_list_params)
    @futureregretlist.user_id = current_user.id # Necessary?
    if @futureregretlist.save
      redirect_to future_futureregretlist_path(@futureregretlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @futureregretlist = Futureregretlist.find(params[:id])
  end

  private

  def future_regret_list_params
    params.require(:futureregretlist).permit(:user_id)
  end
end
