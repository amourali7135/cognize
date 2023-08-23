class BadhabitsController < ApplicationController
  before_action :set_badhabitlist, only: %i[show edit update destroy new create inex] # is this table even needed

  before_action :set_badhabit, only: %i[show edit update destroy new create index]

  def index
    @badhabits = Badhabit.where(user_id: current_user.id)
  end

  def new
    @badhabit = Badhabit.new
  end

  def edit
    @badhabit = Badhabit.find(params[:id])
  end

  def create
    @badhabit = Badhabit.new(badhabit_params)
    @badhabit.badhabitlist = @badhabitlist
    if @badhabit.save
      redirect_to badhabitlist(@badhabitlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @badhabit = Badhabit.find(params[:id])
    @badhabit.destroy
    flash[:notice] = "Your badhabit was successfully deleted!"
    redirect_to badhabitlist(@badhabitlist)
  end

  def update
    @badhabit = Badhabit.find(params[:id])
    if @badhabit.update(badhabit_params)
      flash[:notice] = "Your badhabit was successfully updated"
      redirect_to badhabitlist(@badhabitlist)
    else
      flash[:error] = "There was an error, please try again!"
      render "edit"
    end
  end

  def show
    @badhabit = Badhabit.find(params[:id])
  end

  private

  def set_badhabitlist
    @badhabitlist = Badhabitlist.find(params[:regretlist_id])
  end

  def set_badhabit
    @badhabit = Badhabit.find(params[:id])
  end

  def badhabit_params
    params.require(:badhabit).permit(:title, :description, :reason, :initiate, :priority, :obstacles, :current_status)
  end
end
