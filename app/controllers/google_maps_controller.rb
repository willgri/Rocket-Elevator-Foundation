require 'open_weather'
class GoogleMapsController < ApplicationController
  def index
    @markers = []
    Building.find_each do |building| 
      if building.id < 21
        # SQL request to take data needed from DB
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

        # Taking needed data from address
        streetAddress = address.adress
        city = address.city
        country = address.country
        p(streetAddress, city, country)

        # Finding latitude/longitude with address if not already in DB 
        #(If we don't store in DB loading the page is too long)
        if address.longitude.nil?
        address_position =  ([streetAddress, city, country].compact.join(', '))
        results = Geocoder.search(address_position)

        address.latitude = results.first.coordinates[0]
        address.longitude = results.first.coordinates[1]
        address.save!
        end

        # Finding weather with latitude and longitude
        options = { units: "metric", APPID: ENV['weatherkey'] }
        weather = OpenWeather::Current.geocode(address.latitude, address.longitude, options)
        sky = weather['weather'][0]['main']
        temp = weather['main']["temp"]
        
        # Adding data into markers
        @markers << {
        address: address.adress,
        lat: address.latitude, 
        lng: address.longitude,
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