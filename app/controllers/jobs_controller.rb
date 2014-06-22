# encoding: utf-8
class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  
  def create
    @job = Job.new( job_params )
    @job.client = current_user if current_user
    if @job.save
      redirect_to root_path, notice: "Job was created!"
    else
      redirect_to root_path, alert: "Job couldn't be created"
    end
  end
  
  
  private
    
    def job_params
      params.require(:job).permit( Job::MODEL_PARAMS )
    end
end
