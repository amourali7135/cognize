class CurrentlegacydisconnectController < ApplicationController
  # refactor these later after experimentaiton
  before_action :set_currentlegacy, only: %i[show edit update destroy new create]

  before_action :set_currentlegacydisconnect, only: %i[show edit update destroy new create]

  def new
    @currentlegacydisconnect = Currentlegacydisconnect.new
  end

  def create
    @currentlegacydisconnect = Currentlegacydisconnect.new(current_legacy_disconnect_params)
    @currentlegacydisconnect.user_id = current_user.id
    if @currentlegacydisconnect.save
      redirect_to present_currentlegacy_currentlegacydisconnect(@currentlegacydisconnect)
      flash[:success] = "You've successfully created your legacy disconnect!"
    else
      flash[:notice] = "There was an error, please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @currentlegacydisconnect = Currentlegacydisconnect.find(params[:id])
  end

  def update
    @currentlegacydisconnect = Currentlegacydisconnect.find(params[:id])
    if @currentlegacydisconnect.update(params[:currentlegacydisconnect])
      flash[:notice] = "You've successfully updated your current legacy disconnect"
      redirect_to present_currentlegacy_currentlegacydisconnect(@currentlegacydisconnect_id)
    else
      flash[:error] = "There was an error, please try again"
      render "edit"
    end
  end

  def destroy
    @currentlegacydisconnect = Currentlegacydisconnect.find(params[:id])
    @currentlegacydisconnect.destroy
    redirect_to present_path
    flash[:notice] = 'Your current legacy disconnect was successfully deleted!'
  end

  def show
    @currentlegacydisconnect = Currentlegacydisconnect.find(params[:id])
  end

  private

  def set_currentlegacy
    @currentlegacydisconnect = Currentlegacydisconnect.find(params[:id])
  end

  def set_currentlegacydisconnect
    @currentlegacydisconnect = Currentlegacydisconnect.find(params[:id])
  end

  def current_legacy_disconnect_params
    params.require(:currentlegacydisconnect).permit(:pleased, :reason, :missing)
  end
end
