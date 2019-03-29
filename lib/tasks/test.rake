namespace :test do
    desc "Weather task"
        task weather: :environment do
            require 'open_weather'
            options = { units: "metric", APPID: ENV['weatherkey'] }
            weather = OpenWeather::Current.geocode(37.39, -122.09, options)
            p("Weather: " , weather)
            p("Weather main: ", weather['main']["temp"])
            p("Sky status :" , weather['weather'][0]['main'])
    end
end