class JobCommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_job
  before_action :require_comment_destroyer!, :only => [:destroy]

  def create
    @comment = @job.comments.build( comment_params )
    @comment.user = current_user

    if @comment.save
      @comment.notify_followers
      redirect_to job_url( @job )
    else
      render "/jobs/show"
    end
  end

  def destroy
    @comment = @job.comments.find( params[:id] )
    if comment.can_delete_by?(current_user)
      @comment.destroy
    end
    redirect_to job_url( @job )
  end

  private

  def require_comment_destroyer!
    unless @comment.can_delete_by?(current_user) or @job.can_modify_by?(current_user)
      flash[:alert] = "Sorry! You don't have the authorization to change it!"
      redirect_to :back
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
