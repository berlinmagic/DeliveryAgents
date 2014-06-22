# encoding: utf-8
# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  job_type    :string(255)
#  description :text
#  date        :datetime
#  duration    :integer
#  state       :string(255)
#  client_id   :integer
#  agent_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Job < ActiveRecord::Base
  
  TYPES = %w(care help clean)
  STATES = %w(new accepted refused)
  
  belongs_to :client,       class_name: "User",         foreign_key: :client_id
  belongs_to :agent,        class_name: "User",         foreign_key: :agent_id
  
  has_many :applications,   class_name: "Application",  foreign_key: :job_id
  
  has_one_address
  
end
