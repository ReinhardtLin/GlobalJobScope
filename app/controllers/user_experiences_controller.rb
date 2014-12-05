class UserExperiencesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def index
    @experiences = @user.experiences
  end

  # def show
  #   @experience = @user.experiences.find( params[:id] )
  # end

  def new
    @experience = @user.experiences.build
  end

  def create
    @experience = @user.experiences.build( experience_params )
    if @experience.save
      redirect_to edit_user_url( @user )
    else
      redirect_to :back
    end
  end

  def edit
    @experience = @user.experiences.find( params[:id] )
  end

  def update
    @experience = @user.experiences.find( params[:id] )

    if @experience.update( experience_params )
      redirect_to edit_user_url( @user )
    else
      redirect_to :back
    end

  end

  def destroy
    @experience = @user.experiences.find( params[:id] )
    @experience.destroy

    redirect_to edit_user_url( @user )
  end

  protected

  def find_user
    @user = current_user
  end

  def experience_params
    params.require(:experience).permit(:position_name, :employer_name, :salary, :from, :to, :description, :current_id, :all_locations)
  end
end
