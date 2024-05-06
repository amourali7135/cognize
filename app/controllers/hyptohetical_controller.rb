class HypotheticalsController < ApplicationController
  def create
    @hyptohetical = Hyptohetical.new(hyptohetical_params)
    @hyptohetical.user_id = current_user.id
    if @hyptohetical.save
      redirect_to root_path
      flash[:success] = "You've successfully created your Hyptohetical!"
    else
      flash[:notice] = "There was an error, please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def hyptohetical_params
    params.require(:Hyptohetical).permit(:title)
  end
end
