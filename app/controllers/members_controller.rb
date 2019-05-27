class MembersController < ApplicationController
  def index
    @chorus = Chorus.find_by_id(params[:chorus_id])
    # byebug
    @singers = @chorus.members
  end

  def show
    @singer, @chorus = Chorus.find_by_id(params[:chorus_id]), Singer.find_by_id(params[:id])
    @membership = @singer.memberships.find_by(chorus_id: @chorus.id)
  end

  def new
    @chorus = Chorus.find_by_id(params[:chorus_id])
    redirect_to chorus_members_path unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
    @singer = Singer.new 
    @singer.memberships.first.chorus = @chorus
  end

  def create
    @chorus = Chorus.find_by_id(params[:chorus_id])
    redirect_to chorus_members_path unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
    @singer = Singer.create(member_params)
    unless @singer.save
      @singer.memberships.new
      return render 'new'
    else
      return redirect_to chorus_member_path(@chorus, @singer)
    end
  end

  def edit
    @chorus = Chorus.find_by_id(params[:chorus_id])
    @singer = Singer.find_by_id(params[:id])
    redirect_to chorus_member_path(@chorus, @singer) unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
  end

  def update
    @singer = Singer.find_by_id(params[:id])
    @chorus = Chorus.find_by_id(params[:chorus_id])
    unless @singer
      flash.notice = "resource does not exist"
      return redirect_to chorus_path(params[:chorus_id])
    else
      @singer.update(member_params)
      unless @singer.save
        render 'edit'
      else
        return redirect_to chorus_member_path(@chorus, @singer)
      end
    end
  end

  def delete

  end

  private

  def member_params
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