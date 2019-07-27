class ChorusesController < ApplicationController
  
  # should all chorus access be limited to users? Probably not?
  def index
    @choruses = Chorus.all
  end

  def new
    return redirect_to choruses_path unless user_signed_in?
    @chorus = Chorus.new(user: current_user)
  end

  def create
    @chorus = Chorus.create(chorus_params)
    # byebug
    respond_to do |format| 
      format.html {
        return redirect_to choruses_path unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
        unless @chorus.save
          flash.notice = "Errors have occurred."
          return render 'new'
        else
          # byebug
          return redirect_to chorus_path(@chorus)
        end
      }
      format.json {
        unless user_signed_in? && (@chorus.user == current_user || current_user.admin)
            return render json: {error: "action-not-authorized" }.to_json, status: 401
        else
          unless @chorus.save
            return render json: {errors: @chorus.errors.full_messages }, status: 422
          else
            render json: @chorus
          end
        end
      }
    end
  end

  def show
    @chorus = Chorus.find_by_id(params[:id])
    respond_to do |format|
      format.html {
        unless @chorus
          flash.notice = "Resource does not exist."
          return redirect_to choruses_path
        end
        render 'show'
      }
      format.json do
        render json: @chorus.to_json(include: :memberships)
      end
    end
  end

  def baritones
    @chorus = Chorus.find_by_id(params[:id])
    @baritones = @chorus.baritones
  end

  def basses
    @chorus = Chorus.find_by_id(params[:id])
    @basses = @chorus.basses
  end

  def leads
    @chorus = Chorus.find_by_id(params[:id])
    @leads = @chorus.leads
  end

  def tenors
    @chorus = Chorus.find_by_id(params[:id])
    @tenors = @chorus.tenors
  end

  def edit
    @chorus = Chorus.find_by_id(params[:id])
    unless user_signed_in? && (current_user == @chorus.user || current_user.admin )
      return redirect_to chorus_path(@chorus)
    end
  end

  def update
    
    @chorus = Chorus.find_by_id(params[:id])
    unless @chorus
      flash.notice = "resource does not exist"
      return redirect_to chorus_path(params[:id])
    else
      @chorus.update(chorus_params)
      unless @chorus.save
        render 'edit'
      else
        return redirect_to chorus_path(@chorus)
      end
    end
  end

  def delete

  end

  private

  def chorus_params # TODO
    params.require(:chorus).permit(:name, :user_id, membership_attributes: [:singer_id, :baritone, :bass, :lead, :tenor, :section_leader])
  end
end
