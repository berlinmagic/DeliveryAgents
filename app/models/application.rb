# encoding: utf-8
# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  agent_id   :integer
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Application < ActiveRecord::Base
  
  belongs_to :job,    class_name: "Job",    foreign_key: :job_id
  belongs_to :agent,  class_name: "User",   foreign_key: :agent_id
  
end
