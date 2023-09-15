class CurrentlegacyController < ApplicationController
  before_action :set_currentlegacy, only: %i[show edit update destroy new create]

  def new
    @currentlegacy = Currentlegacy.new
  end

  def create
    @currentlegacy = Currentlegacy.new(current_legacy_params)
    @currentlegacy.user_id = current_user.id
    if @currentlegacy.save
      redirect_to present_currentlegacy_path(@currentlegacy)
      flash[:success] = "You've successfully created your legacy!"
    else
      flash[:notice] = "There was an error, please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @currentlegacy = Currentlegacy.find(params[:id])
  end

  def update
    @currentlegacy = Currentlegacy.find(params[:id])
    if @currentlegacy.update(params[:currentlegacy])
      flash[:notice] = "You've successfully updated your current legacy"
      redirect_to present_currentlegacy_path(@currentlegacy)
    else
      flash[:error] = "There was an error, please try again"
      render "edit"
    end
  end

  # should I even allow this to be an option?
  def destroy
    @currentlegacy = Currentlegacy.find(params[:id])
    @currentlegacy.destroy(params[:currentlegacy])
    redirect_to present_path
    flash[:notice] = 'Your current legacy was successfully deleted!'
  end

  def show
    @currentlegacy = Currentlegacy.find(params[:id])
  end

  private

  def set_currentlegacy
    @currentlegacy = Currentlegacy.find(params[:id])
  end

  def current_legacy_params
    params.require(:currentlegacy).permit(:memorialized, :epitaph, :remembered_for)
  end
end
