class UsersController < ApplicationController
  def show
    # byebug
    @user = User.find_by_id(params[:id])
    return redirect_to root_path unless @user
    respond_to do |format|
      format.html { 
        if ( current_user == @user && params[:view] != "true") 
          render :my_profile
        else
          render :show
        end
      }
      format.json { render json: @user, status: 200 }
    end

  end

  def index
    @users = User.all
  end

  def edit_memberships
    @user = User.find_by_id(params[:id])

    render partial: 'mem_form' 
  end

  def new_membership
    @user = User.find_by_id(params[:id])
    @mem = @user.profile.memberships.build
    render partial: 'new_mem_form', locals: {memberships: @mem }
  end
end
