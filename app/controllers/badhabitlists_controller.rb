class BadhabitlistsController < ApplicationController
  def new
    @badhabitlist = Badhabitlist.new
  end

  def create
    @badhabitlist = Badhabitlist.new(bad_habit_list_params)
    @badhabitlist.user_id = current_user.id # Necessary?
    if @badhabitlist.save
      redirect_to present_badhabitlist_path(@badhabitlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @badhabitlist = Badhabitlist.find(params[:id])
  end

  private

  def bad_habit_list_params
    params.require(:badhabitlist).permit(:user_id)
  end
end
