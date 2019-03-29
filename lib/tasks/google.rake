namespace :test do
    desc "Weather task"
        task google: :environment do

            # @building = Building.all
            # @marker = []

            # Building.find_each do |building|
            #     address = building.address
            #     clientName = building.customer.count
            #     numberBattery = building.
            #     numberColumn = 
            #     numberElevator =
            #     contactName =

            addresss = (["750 Boulevard Lebourgneuf", "Quebec", "QC"].compact.join(', '))
            results2 = Geocoder.search(addresss)
            p(results2.first.coordinates[0])


      
    end
end



            # results = Geocoder.search([46.8311967, -71.3049867])
            # p(results.first.address)

            # addresss = (["750 Boulevard Lebourgneuf", "Quebec", "QC"].compact.join(', '))
            # results2 = Geocoder.search(addresss)
            # p(results2.first.coordinates)