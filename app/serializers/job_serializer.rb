class JobSerializer < ActiveModel::Serializer
  attributes :id, :description, :client_name, :state, :address_name, :lat, :lon, :date

  def client_name
    object.client.name
  end

  def address_name
    "#{object.address.street} #{object.address.street_number}, #{object.address.city}"
  end

  def lat
    object.address.latitude
  end

  def lon
    object.address.longitude
  end

  def date
    object.date.strftime("%d/%m/%Y")
  end
end
