class SingersController < ApplicationController
  def index
    @singers = Singer.all
  end

  def new
    # require user login
    @singer = Singer.new
  end

  def create
    @singer = Singer.create(singer_params)
    unless @singer.save
      flash.notice = "Errors have occurred."
      return render 'new'
    else
      return redirect_to singer_path(@singer)
    end
  end

  def show
    @singer = Singer.find_by_id(params[:id])
    unless @singer
      flash.notice = "Resource does not exist."
      redirect_to 'index'
    end
  end

  def edit
    unless current_user.admin
      # ignore the param for most users, they may only edit their own profile
      @singer = Singer.find_by_id(current_user.singer)
    else
      @singer = Singer.find_by_id(params[:id])
      unless @singer
        flash.notice = "No such profile"
        return redirect_to singers_path
      end
    end
  end

  def update
    # require user login
  end

  def delete
    # require user login
  end

  private

  def singer_params #TODO
    params.require(:singer).permit()
  end
end
