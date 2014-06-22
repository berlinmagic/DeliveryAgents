# encoding: utf-8
class JobsController < ApplicationController
  
  def index
    if current_user
      if current_user.state == "agent"
        @jobs = current_user.job_offers
      else
        @jobs = current_user.offered_jobs
      end
    else
      @jobs = []
    end
  end
  
  def new
    @job = Job.new
  end
  
  
  def create
    @job = Job.new( job_params )
    @job.client = current_user if current_user
    if @job.save
      flash[:notice] = "Job was created!"
      render :create
    else
      flash[:alert] = "Job couldn't be created"
      render :new
    end
  end
  
  
  private
    
    def job_params
      params.require(:job).permit( Job::MODEL_PARAMS )
    end
end
