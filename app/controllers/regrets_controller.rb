class RegretsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

  def show
    @futureregretlist = Futureregretlist.find(params[:id])
  end

  private

  def regret_params
    params.require(:regret).permit()
  end
end
