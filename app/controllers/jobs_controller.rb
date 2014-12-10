class JobsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :set_job, :only => [ :show, :follower, :edit, :edit1, :edit2, :edit3, :update, :destroy, :hide]
  before_action :require_job_poster!, :only => [:follower, :edit, :edit1, :edit2, :edit3, :update, :destroy, :hide]

  def index
    if params[:keyword]
      @jobs = Job.search(params[:keyword]).records
    elsif params[:location]
      @jobs = Job.located_with(params[:location])
    else
      @jobs = Job.none
    end
  end

  def following
    @jobs = current_user.following_jobs

    render :index
  end

  def posting
    @jobs = current_user.jobs
    @enable_post_new_job = true

    render :index
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      flash[:notice] = "The job was successfully posted"
      redirect_to job_path(@job)
    else
      redirect_to :back
    end
  end

  def show
    @page_title = @job.position
  end

  def follower
  end

  def edit
  end

  def edit1
  end

  def edit2
  end

  def edit3
  end

  def update
    if @job.update(job_params)
      flash[:notice] = "The job was successfully updated"
      redirect_to job_url(@job)
    else
      redirect_to :back
    end
  end

  def destroy
    @job.destroy
    flash[:alert] = "The job was successfully deleted"
    redirect_to posting_jobs_url
  end

  def hide
    @job.terminate!

    redirect_to job_path(@job)
  end

  private

  def require_job_poster!
    unless @job.can_modify_by?(current_user)
      flash[:alert] = "Sorry! You don't have the authorization to change it!"
      redirect_to :back
    end
  end

  def job_params
    params.require(:job).permit(:position_name, :employer_name, :number, :deadline, :salary_min, :salary_max, :currency, :requirement, :responsibility, :company_profile, :suggestion, :all_locations, :type_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
