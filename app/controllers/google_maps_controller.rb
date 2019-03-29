require 'open_weather'
class GoogleMapsController < ApplicationController
  def index
    @markers = []
    Building.find_each do |building| 
      if building.id < 16
        address = building.address
        clientName = building.customer.full_name
        batteries = building.batteries.count
        battery_ids = building.battery_ids
        columns = Column.where(battery_id: battery_ids).count
        column_ids = Column.where(battery_id: building.battery_ids).ids
        elevators = Elevator.where(column_id: column_ids).count
        contact = building.building_admin_full_name
        building.batteries.all.each do |battery|
          floor = battery.columns.first.number_of_floor

        streetAddress = address.adress
        city = address.city
        country = address.country
        p(streetAddress, city, country)
      
        # address_position =  (["750 Boulevard Lebourgneuf", "Quebec", "QC"].compact.join(', '))
        address_position =  ([streetAddress, city, country].compact.join(', '))
        results = Geocoder.search(address_position)
        lat = results.first.coordinates[0]
        lon = results.first.coordinates[1]
        p(lat)
        p(lon)
      
        
        
        # address_position =  (["750 Boulevard Lebourgneuf", "Quebec", "QC"].compact.join(', '))
        # ([streetAddress, city, country].compact.join(', '))
        # p(lon)

        options = { units: "metric", APPID: ENV['weatherkey'] }
        weather = OpenWeather::Current.geocode(lat, lon, options)
        sky = weather['weather'][0]['main']
        temp = weather['main']["temp"]

        @markers << {
        address: address.adress,
        lat: lat, 
        lng: lon,
        customer: clientName,
        batteries: batteries,
        columns: columns, 
        elevators: elevators,
        contact: contact,
        floor: floor,
        sky: sky,
        temp: temp }
        end
      end
    end
  end
end