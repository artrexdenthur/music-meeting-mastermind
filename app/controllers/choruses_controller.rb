class ChorusesController < ApplicationController
  
  # should all chorus access be limited to users? Probably not?
  def index

  end

  def new
    # require user login
    @chorus = Chorus.new
  end

  def create
    @chorus = Chorus.create(chorus_params)
    unless @chorus.save
      flash.notice = "Errors have occurred."
      return render 'new'
    else
      return redirect_to chorus_path(@chorus)
    end
  end

  def show
    @chorus = Chorus.find_by_id(params[:id])
    unless @chorus
      flash.notice = "Resource does not exist."
      redirect_to 'index'
    end
  end

  def baritones
    @chorus = params[:id]
    @baritones = @chorus.baritones
  end

  def basses
    @chorus = params[:id]
    @basses = @chorus.basses
  end

  def leads
    @chorus = params[:id]
    @leads = @chorus.leads
  end

  def tenors
    @chorus = params[:id]
    @tenors = @chorus.tenors
  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def chorus_params # TODO
    params.require(:chorus).permit()
  end
end
