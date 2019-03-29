namespace :test do
    desc "Weather task"
        task weather: :environment do
            require 'open_weather'
            options = { units: "metric", APPID: "82021d180d9e5567fdc52b7c016ef03e" }
            weather = OpenWeather::Current.geocode(37.39, -122.09, options)
            p("Weather: " , weather)
            p("Weather main: ", weather['main']["temp"])
            p("Sky status :" , weather['weather'][0]['main'])
    end
end