
require 'geocode'

class Full_Address < Activerecord::Base

     before_save :geocode
     geocoded_by :address_for_geocoding, :latitude  => :lat, :longitude => :lng

    def address_for_geocoding

    street = Address.adress
    city = Address.city
    country = Address.country
    f_address = [street, city, country].compact.join(', ')

    end
end