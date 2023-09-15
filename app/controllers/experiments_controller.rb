class ExperimentsController < ApplicationController
  before_action :set_experiment, only: %i[show edit update destroy new create]

  def index
    @experiments = Experiment.where(user_id: current_user.id)
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.user_id = current_user.id
    if @experiment.save
      redirect_to past_experiment_path(@experiment)
      flash[:success] = "You've successfully created your experiment!"
    else
      flash[:notice] = "There was an error, please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update(params[:experiment])
      flash[:notice] = "You've successfully updated your expeirment"
      redirect_to past_experiment_path(@experiment)
    else
      flash[:error] = "There was an error, please try again"
      render "edit"
    end
  end

  # should I even allow this to be an option?
  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy(params[:experiment])
    redirect_to present_path
    flash[:notice] = 'Your experiment was successfully deleted!'
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  private

  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(:title, :description, :obstacles, :initiate, :priority, :current_status)
  end
end
