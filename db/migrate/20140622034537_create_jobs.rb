class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string      :job_type
      t.text        :description
      t.datetime    :date
      t.integer     :duration
      t.string      :state
      t.references  :client
      t.references  :agent

      t.timestamps
    end
    
    add_index :jobs, :client_id
    add_index :jobs, :agent_id
    
  end
end
