# encoding: utf-8
class Job < ActiveRecord::Base
  
  TYPES = %w(new accepted refused)
  
  belongs_to :client,       class_name: "User",         foreign_key: :client_id
  belongs_to :agent,        class_name: "User",         foreign_key: :agent_id
  
  has_many :applications,   class_name: "Application",  foreign_key: :job_id
  
  has_one_address
  
end
