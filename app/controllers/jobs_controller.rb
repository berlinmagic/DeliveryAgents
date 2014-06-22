# encoding: utf-8
class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  
  def create
    @job = Job.new( job_params )
  end
  
  
  private
    
    def job_params
      params.require(:job).permit( Job::MODEL_PARAMS )
    end
end
