class JobSubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job
  before_action :find_submission, :only => [:admit, :reject, :confirm, :decline, :emphasize, :refuse]
  before_action :require_job_poster!, :only => [:admit, :reject, :emphasize, :refuse]
  before_action :require_submission_applicant!, :only => [:confirm, :decline]

  def create
    @submission = @job.submissions.build
    @submission.user = current_user

    if @submission.save
      redirect_to job_url( @job )
    else
      redirect_to :back
    end
  end

  def admit
    @submission.admit!
    redirect_to :back
  end

  def reject
    @submission.reject!
    redirect_to :back
  end

  def confirm
    @submission.confirm!
    redirect_to :back
  end

  def decline
    @submission.decline!
    redirect_to :back
  end

  def emphasize
    @submission.emphasize!
    redirect_to :back
  end

  def refuse
    @submission.refuse!
    redirect_to :back
  end

  protected

  def require_job_poster!
    unless @job.can_modify_by?(current_user)
      flash[:alert] = "Sorry! You don't have the authorization to change it!"
      redirect_to :back
    end
  end

  def require_submission_applicant!
    unless @submission.can_modify_by?(current_user)
      flash[:alert] = "Sorry! You don't have the authorization to change it!"
      redirect_to :back
    end
  end

  def find_submission
    @submission = @job.submissions.find( params[:id] )
  end

end
