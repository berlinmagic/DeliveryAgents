# encoding: utf-8
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
