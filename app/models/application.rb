# encoding: utf-8
class Application < ActiveRecord::Base
  
  belongs_to :job,    class_name: "Job",    foreign_key: :job_id
  belongs_to :agent,  class_name: "User",   foreign_key: :agent_id
  
end
