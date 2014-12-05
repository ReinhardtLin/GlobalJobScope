class UserEducationsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def index
    @educations = @user.educations
  end

  # def show
  #   @education = @user.educations.find( params[:id] )
  # end

  def new
    @education = @user.educations.build
  end

  def create
    @education = @user.educations.build( education_params )
    if @education.save
      redirect_to edit_user_url( @user )
    else
      redirect_to :back
    end
  end

  def edit
    @education = @user.educations.find( params[:id] )
  end

  def update
    @education = @user.educations.find( params[:id] )

    if @education.update( education_params )
      redirect_to edit_user_url( @user )
    else
      redirect_to :back
    end

  end

  def destroy
    @education = @user.educations.find( params[:id] )
    @education.destroy

    redirect_to edit_user_url( @user )
  end

  protected

  def find_user
    @user = current_user
  end

  def education_params
    params.require(:education).permit(:degree_name, :institute_name, :from, :to, :description, :current_id, :all_locations, :all_professions)
  end
end
