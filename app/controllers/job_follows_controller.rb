class JobFollowsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_job

  def create
    existed_follow = @job.find_by_follow(current_user)

    unless existed_follow
      @follow = @job.follows.build( params[:id] )
      @follow.user = current_user
      @follow.save!
    end

    redirect_to :back
  end

  def destroy
    @follow = @job.follows.find( params[:id] )

    if @follow.can_delete_by?(current_user)
      @follow.destroy
    end

    redirect_to :back
  end

end
