class CurrentlegacyController < ApplicationController
  before_action :set_currentlegacy, only: %i[show edit update destroy new create index]

  def new
    @currentlegacy = Currentlegacy.new
  end

  def create
    @currentlegacy = Currentlegacy.new(current_legacy_params)
    @currentlegacy.user_id = current_user.id
    if @currentlegacy.save
      redirect_to present_currentlegacy_path(@currentlegacy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @currentlegacy = Currentlegacy.find(params[:id])
  end

  def update
  end

  def destroy
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
