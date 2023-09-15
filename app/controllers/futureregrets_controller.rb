class FutureregretsController < ApplicationController
  before_action :set_regretlist, only: %i[show edit update destroy new create inex] # is this table even needed

  before_action :set_regret, only: %i[show edit update destroy new create index]

  def index
    @regrets = Regret.where(user_id: current_user.id)
  end

  def new
    @regret = Regret.new
  end

  def edit
    @regret = Regret.find(params[:id])
  end

  def create
    @regret = Regret.new(regret_params)
    @regret.regretlist = @regretlist
    if @regret.save
      redirect_to past_regretlist(@regretlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @regret = Regret.find(params[:id])
    @regret.destroy
    flash[:notice] = "Your regret was successfully deleted!"
    redirect_to past_regretlist(@regretlist)
  end

  def update
    @regret = Regret.find(params[:id])
    if @regret.update(regret_params)
      flash[:notice] = "Your regret was successfully updated"
      redirect_to past_regretlist(@regretlist)
    else
      flash[:error] = "There was an error, please try again!"
      render "edit"
    end
  end

  def show
    @regret = Regret.find(params[:id])
  end

  private

  def set_regretlist
    @regretlist = Regretlist.find(params[:regretlist_id])
  end

  def set_regret
    @regret = Regret.find(params[:id])
  end

  def regret_params
    params.require(:regret).permit(:title, :description, :root_cause, :prevention_later, :lesson_learned, :priority,
                                   :closure, :achieve_closure)
  end
end
