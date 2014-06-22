class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references    :job
      t.references    :agent
      t.string        :state
      t.timestamps
    end
    
    add_index :applications, :job_id
    add_index :applications, :agent_id
    
  end
end
