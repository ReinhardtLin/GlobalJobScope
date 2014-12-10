class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_user!, :only => [:edit, :edit1, :edit2, :edit3, :update]

  def index
    if params[:country]
      @users = User.lived_with(params[:country])
      @users = User.visaed_with(params[:country])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @jobs = @user.jobs.all
    @experiences = @user.experiences.all
    @educations = @user.educations.all
  end

  def edit
    @user = current_user
  end

  def edit1
    @user = current_user
  end

  def edit2
    @user = current_user
  end

  def edit3
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "Your profile was successfully updated"
      redirect_to user_url(@user)
    else
      redirect_to :back
    end
  end

  private

  def authorize_user!
    unless self == current_user
      flash[:alert] = "Sorry! You don't have the authorization to change it!"
      redirect_to :back
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :birthday, :summary, :skill, :other_info, :gender_id, :all_countries, :all_eligibles, :all_locations, :logo, :all_languages, :speakings_attributes => [:id, :language_name, :name, :_destroy] )
  end
end
