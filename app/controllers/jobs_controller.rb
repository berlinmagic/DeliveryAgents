# encoding: utf-8
class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  
end