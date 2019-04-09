require 'pg'
namespace :connect do
  desc "Connection task"
        # rake connect:dwh
      task dwh: :environment do
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "postgres", user: "postgres", password: "1234")
        # conn = PG::Connection.open(host: "localhost", port: 5432, dbname: "postgres", user: "postgres", password: "1234")

        conn.exec ("TRUNCATE factquotes RESTART IDENTITY")
        Quote.all.each do |quote|
            conn.exec("INSERT INTO \"factquotes\" (quote_id, created_at, business_name, email, number_elevator) 
            VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.business_name}', '#{quote.email}', #{quote.number_elevator})")          
        end

        conn.exec ("TRUNCATE factcontact RESTART IDENTITY")
        Lead.all.each do |lead|
            conn.exec("INSERT INTO \"factcontact\" (lead_id, created_at, business_name, email, project_name) 
            VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.business_name}', '#{lead.email}', '#{lead.project_name}')")
        end

        conn.exec ("TRUNCATE factelevator RESTART IDENTITY")
        Elevator.all.each do |elevator|
            conn.exec("INSERT INTO \"factelevator\" (elevator_id, serial_number, installation_date, building_id, customer_id, building_city) 
            VALUES (#{elevator.id}, '#{elevator.serial_number}', '#{elevator.installation_date}', '#{elevator.column.battery.building_id}', #{elevator.column.battery.building.customer_id}, $$'#{elevator.column.battery.building.address.city}'$$)")
        end

        conn.exec("TRUNCATE dimcustomers RESTART IDENTITY")
        
        Customer.all.each do |customer|  
          numbers_of_elevators = 0 
            customer.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                      numbers_of_elevators += column.elevators.count
                      end
                  end
              end
              
              sql = ("INSERT INTO \"dimcustomers\" (date_of_creation, business_name, full_name, email, numbers_of_elevators, city) 
              VALUES ('#{customer.date_of_creation}', '#{customer.business_name}', '#{customer.full_name}', '#{customer.email}', #{numbers_of_elevators}, $$'#{customer.address.city}'$$)")
              conn.exec(sql)
          end
     end     
end
