class SingersController < ApplicationController
  def index
    @singers = Singer.all
  end

  def new
    # requires site admin privileges
    redirect_to singers_path unless user_signed_in? && current_user.admin
    @singer = Singer.new
    @singer.memberships.new
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
    return redirect_to Singer.find_by_id(params[:id]) unless user_signed_in?
    unless current_user.admin
      # ignore the param for most users, they may only edit their own profile
      @singer = Singer.find_by_id(current_user.singer)
    else
      @singer = Singer.find_by_id(params[:id])
      unless @singer
        flash.notice = "No such profile"
        return redirect_to singers_path
      end
      @singer.memberships.new
    end
  end

  def update
    @singer = Singer.find_by_id(params[:id])
    unless @singer
      flash.notice = "resource does not exist"
      return redirect_to root_path
    end
    unless user_signed_in? && (@singer.user == current_user || current_user.admin)
      flash.warning = "Action not authorized"
      return redirect_to singer_path(@singer)
    else
      @singer.update(singer_params)
      unless @singer.save
        byebug
        flash.notice = "There were some errors"
        render 'edit'
      else
        return redirect_to singer_path(@singer)
      end
    end
  end

  def delete
    # require user login
  end

  private

  def singer_params #TODO
    params.require(:singer).permit(
      :name, :preferred_voice_part, :id,
      memberships_attributes: [
        :id,
        :singer_id,
        :chorus_id,
        :baritone,
        :bass,
        :lead,
        :tenor,
        :section_leader
      ]
      )
  end
end
