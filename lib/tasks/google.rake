namespace :test do
    desc "Weather task"
        task google: :environment do
            addresss = (["750 Boulevard Lebourgneuf", "Quebec", "QC"].compact.join(', '))
            results2 = Geocoder.search(addresss)
            p(results2.first.coordinates[0])  
    end
end