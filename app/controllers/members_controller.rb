class MembersController < ApplicationController
  def index
    @chorus = Chorus.find_by_id(params[:chorus_id])
    # byebug
    @singers = @chorus.members
  end

  def show
    @singer, @chorus = Chorus.find_by_id(params[:chorus_id]), Singer.find_by_id(params[:id])
  end

  def new
    @chorus = Chorus.find_by_id(params[:chorus_id])
    redirect_to chorus_members_path unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
    @singer = Singer.new
    @singer.choruses << @chorus
  end

  def create
    redirect_to chorus_members_path unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
    @singer = Singer.create(member_params)
    
  end

  def edit
    @chorus = Chorus.find_by_id(params[:chorus_id])
    @singer = Singer.find_by_id(params[:id])
    redirect_to chorus_member_path(@chorus, @singer) unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
  end

  def update

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