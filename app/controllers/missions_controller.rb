class MissionsController < ApplicationController
	before_filter :check_admin, :only => [:new, :create, :list, :edit, :update]

  def new
	  @mission = Mission.new
  end

  def create
	  @mission = Mission.new(params[:mission])
	  @mission.game = @current_game
	  if @mission.save()
		  redirect_to mission_list_url()
	  else 
		  flash[:error] = @mission.errors.full_messages.first
		  redirect_to new_mission_url()
	  end

  end

  def index	
	  @missions = @current_game.missions.sort{|x,y| x.start <=> y.start}
  end

  def show
	  @mission = Mission.find(params[:id])
  end

  def list
	  @missions = @current_game.missions
  end

  def edit
	@mission = Mission.find(params[:id])
  end

  def update
	@mission = Mission.find(params[:id])
	if @mission.update_attributes(params[:mission])
		redirect_to missions_url()
	else
		flash[:error] = "Could not save mission!"
		redirect_to root_url()
	end
  end

end