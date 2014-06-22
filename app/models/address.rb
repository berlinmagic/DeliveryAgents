# encoding: utf-8
# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  street        :string(255)
#  street_number :string(255)
#  zip           :string(255)
#  city          :string(255)
#  subcity       :string(255)
#  state         :string(255)
#  country       :string(255)
#  longitude     :float
#  latitude      :float
#  owner_id      :integer
#  owner_type    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Address < ActiveRecord::Base

  MODEL_PARAMS = [      :street, :street_number, :zip, :city, :subcity, :state, :country,
                        :latitude, :longitude, :visibility,  :_destroy                    ]

  # =====> A S S O Z I A T I O N S <======================================================== #
  belongs_to :owner, :polymorphic => true

  def address
    adr = []
    adr << street if street.present?
    adr << "#{street_number}," if street_number.present? && street.present?
    adr << zip if zip.present?
    adr << city if city.present?
    if adr.count == 0
      I18n.t("addresses.no_address_given")
    else
      adr.join(" ")
    end
  end
end
