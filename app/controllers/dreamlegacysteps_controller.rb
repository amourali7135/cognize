class DreamlegacystepsController < ApplicationController
  before_action :set_dreamlegacy, only: %i[show edit update destroy new create index] # is this table even needed

  before_action :set_dreamlegacystep, only: %i[show edit update destroy new create index]

  def index
    @dreamlegacysteps = Dreamlegacystep.where(user_id: current_user.id)
  end

  def new
    @dreamlegacystep = Dreamlegacystep.new
  end

  def edit
    @dreamlegacystep = Dreamlegacystep.find(params[:id])
  end

  def create
    @dreamlegacystep = Dreamlegacystep.new(dreamlegacystep_params)
    @dreamlegacystep.dreamlegacy = @dreamlegacy
    if @dreamlegacystep.save
      redirect_to dreamlegacy(@dreamlegacy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @dreamlegacystep = Dreamlegacystep.find(params[:id])
    @dreamlegacystep.destroy
    flash[:notice] = "Your dreamlegacystep was successfully deleted!"
    redirect_to dreamlegacy(@dreamlegacy)
  end

  def update
    @dreamlegacystep = Dreamlegacystep.find(params[:id])
    if @dreamlegacystep.update(dreamlegacystep_params)
      flash[:notice] = "Your dreamlegacystep was successfully updated"
      redirect_to dreamlegacy(@dreamlegacy)
    else
      flash[:error] = "There was an error, please try again!"
      render "edit"
    end
  end

  def show
    @dreamlegacystep = Dreamlegacystep.find(params[:id])
  end

  private

  def set_dreamlegacy
    @dreamlegacy = Dreamlegacy.find(params[:dreamlegacy_id])
  end

  def set_dreamlegacystep
    @dreamlegacystep = Dreamlegacystep.find(params[:id])
  end

  def dreamlegacystep_params
    params.require(:dreamlegacystep).permit(:title, :description, :obstacles, :initiate, :current_status)
  end
end
