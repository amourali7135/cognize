class DreamlegacyController < ApplicationController
  before_action :set_dreamlegacy, only: %i[show edit update destroy new create]

  def new
    @dreamlegacy = Dreamlegacy.new
  end

  def create
    @dreamlegacy = Dreamlegacy.new(dream_legacy_params)
    @dreamlegacy.user_id = current_user.id
    if @dreamlegacy.save
      redirect_to present_currentlegacy_path(@dreamlegacy)
      flash[:success] = "You've successfully imagined your dream legacy!"
    else
      flash[:notice] = "There was an error, please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dreamlegacy = Dreamlegacy.find(params[:id])
  end

  def update
    @dreamlegacy = Dreamlegacy.find(params[:id])
    if @dreamlegacy.update(params[:dreamlegacy])
      flash[:notice] = "You've successfully updated your current legacy"
      redirect_to present_currentlegacy_path(@dreamlegacy)
    else
      flash[:error] = "There was an error, please try again"
      render "edit"
    end
  end

  # should I even allow this to be an option?
  def destroy
    @dreamlegacy = Dreamlegacy.find(params[:id])
    @dreamlegacy.destroy(params[:dreamlegacy])
    redirect_to present_path
    flash[:notice] = 'Your current legacy was successfully deleted!'
  end

  def show
    @dreamlegacy = Dreamlegacy.find(params[:id])
  end

  private

  def set_dreamlegacy
    @dreamlegacy = Dreamlegacy.find(params[:id])
  end

  def dream_legacy_params
    params.require(:dreamlegacy).permit(:memorialized, :epitaph, :remembered_for)
  end
end
