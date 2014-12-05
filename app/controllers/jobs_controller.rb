class JobsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :set_job, :only => [ :show, :follower, :edit, :edit1, :edit2, :edit3, :update, :destroy]

  def index
    if params[:location]
      @jobs = Job.located_with(params[:location])
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      flash[:notice] = "The job was successfully posted"
      redirect_to edit1_job_path(@job)
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:alert] = "The job was successfully deleted"
    redirect_to jobs_url
  end

  private

  def job_params
    params.require(:job).permit(:position_name, :employer_name, :number, :deadline, :salary_min, :salary_max, :currency, :requirement, :responsibility, :company_profile, :suggestion, :all_locations, :type_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
