# encoding: utf-8
module HasAddress
  
  def self.included(base)
    base.send :extend, ClassMethods
  end
  
  ##   C L A S S - M E T H O D S   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  module ClassMethods
    
    def has_addresses
      # => send :include, InstanceMethods
      has_many    :addresses,
                  :as => :owner,
                  :class_name => "Address",
                  :dependent => :destroy
      accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank
    end
    
    def has_one_address
      send :include, InstanceMethods
      
      has_one     :address,
                  :as => :owner,
                  :class_name => "Address",
                  :autosave => true,
                  :dependent => :destroy
      
      delegate    :street, :street=, :street_number, :street_number=, :zip, :zip=, :city, :city=,
                  :subcity, :subcity=, :state, :state=, :country, :country=,  to: :address, allow_nil: true
      
      accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
      
      alias_method_chain :address, :build
    end
    
  end #> ClassMethods
  
  ##   I N S T A N C E - M E T H O D S   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  module InstanceMethods
    
    # http://stackoverflow.com/a/4033761
    def address_with_build
      self.address_without_build || self.build_address
    end
    
    # => def check_for_location_stuff
    # =>   if self.locations && !self.locations.blank?
    # =>     self.locations.each do |key, value|
    # =>       # bla
    # =>     end
    # =>   end
    # => end
  
  end #> InstanceMethods
  
end
