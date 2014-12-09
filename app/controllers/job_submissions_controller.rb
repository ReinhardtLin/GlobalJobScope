class JobSubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job
  before_action :find_submission, :only => [:admit, :reject, :confirm, :decline, :emphasize]

  def create
    @submission = @job.submissions.build
    @submission.user = current_user

    if @submission.save
      # @submission.apply
      # @submission.notify_followers
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

  def find_submission
    @submission = @job.submissions.find( params[:id] )
  end

end
