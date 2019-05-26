class MembersController < ApplicationController
  def index
    @chorus = Chorus.find_by_id(params[:chorus_id])
    # byebug
    @singers = @chorus.members
  end

  def show; end

end