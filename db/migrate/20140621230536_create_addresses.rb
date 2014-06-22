class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string      :street
      t.string      :street_number
      t.string      :zip
      t.string      :city
      t.string      :subcity
      t.string      :zip
      t.string      :state 
      t.string      :country
      t.float       :longitude
      t.float       :latitude
      t.references  :owner,                 :polymorphic => true

      t.timestamps
    end
    
    add_index :addresses, [:owner_type, :owner_id]
    add_index :addresses, :longitude
    add_index :addresses, :latitude
    
  end
end
