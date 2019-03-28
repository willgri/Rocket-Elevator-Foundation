
require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seed', 'lead.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|   
    t = Lead.new
    t.id = row['Id']
    t.full_name = row['full_name']
    t.business_name = row['business_name']
    t.email = row['email']
    t.phone_number = row['phone_number']
    t.project_name = row['project_name']
    t.project_description = row['project_description']
    t.department_in_charge_of_elevators = row['department_in_charge_of_elevators']
    t.message = row['message']
    t.attached_file = row['attached_file']
    t.file_name = "#{t.business_name}_file.txt"
    t.date = row['date']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']

    t.save!
      
  end

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seed', 'Employees.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|   
    t = Admin.new
    t.id = row['Id']
    t.created_at = row['Created at']
    t.updated_at = row['Updated at']
    t.email = row['Email']
    t.password = "123456"
    t.reset_password_sent_at = row['Reset password sent at']
    t.remember_created_at = row['Remember created at']
    t.first_name = row['first_name']
    t.last_name = row['last_name']
    t.title = row['Title']
    t.save!
    # puts "#{t.email}, #{t.created_at} saved"    
  end

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seed', 'Address.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|   
    t = Address.new
    t.id = row['Id']
    t.address_type = row['address_type']
    t.status = row['status']
    t.entity = row['entity']
    t.adress = row['adress']
    t.appartment = row['appartment']
    t.city = row['city']
    t.postal_code = row['postal_code']
    t.country = row['country']
    t.notes = row['notes']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!
      
  end


  require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seed', 'Customer.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|   
    t = Customer.new
    t.id = row['Id']
    t.address_id = row['address_id']
    t.admins_id = row['admins_id']
    t.date_of_creation = row['date_of_creation']
    t.business_name = row['business_name']
    t.full_name = row['full_name']
    t.phone_number = row['phone_number']
    t.email = row['email']
    t.business_description = row['business_description']
    t.technical_ressource_phone_number = row['technical_ressource_phone_number']
    t.technical_ressource_email = row['technical_ressource_email']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.save!   
  end

  require 'csv'
  csv_text = File.read(Rails.root.join('lib', 'seed', 'Building.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|   
      t = Building.new
      t.id = row['Id']
      t.customer_id = row['customer_id']
      t.address_id = row['address_id']
      t.building_admin_full_name = row['building_admin_full_name']
      t.building_admin_email = row['building_admin_email']
      t.building_admin_phone_number = row['building_admin_phone_number']
      t.technical_ressource_full_name = row['technical_ressource_full_name']
      t.technical_ressource_phone_number = row['technical_ressource_phone_number']
      t.technical_ressource_email = row['technical_ressource_email']
      t.created_at = row['created_at']
      t.updated_at = row['updated_at']
      t.save!
         
    end

    require 'csv'
    csv_text = File.read(Rails.root.join('lib', 'seed', 'BuildingDetail.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|   
        t = BuildingDetail.new
        t.id = row['Id']
        t.building_id = row['building_id']
        t.information_key = row['information_key']
        t.value = row['value']
        t.created_at = row['created_at']
        t.updated_at = row['updated_at']
        t.save!
          
      end

      
    require 'csv'
    csv_text = File.read(Rails.root.join('lib', 'seed', 'battery.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|   
        t = Battery.new
        t.id = row['Id']
        t.building_id = row['building_id']
        t.admins_id = row['admins_id']
        t.atype = row['atype']
        t.status = row['status']
        t.last_inspection_date = row['last_inspection_date']
        t.operation_certificate = row['operation_certificate']
        t.informations = row['informations']
        t.notes = row['notes']
        t.created_at = row['created_at']
        t.updated_at = row['updated_at']
        t.save!
          
      end

      require 'csv'
      csv_text = File.read(Rails.root.join('lib', 'seed', 'column.csv'))
      csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
      csv.each do |row|   
          t = Column.new
          t.id = row['Id']
          t.battery_id = row['battery_id']
          t.atype = row['atype']
          t.number_of_floor = row['number_of_floor']
          t.status = row['status']
          t.information = row['information']
          t.notes = row['notes']
          t.created_at = row['created_at']
          t.updated_at = row['updated_at']
          t.save!
            
        end

        
      require 'csv'
      csv_text = File.read(Rails.root.join('lib', 'seed', 'elevator.csv'))
      csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
      csv.each do |row|   
          t = Elevator.new
          t.id = row['Id']
          t.column_id = row['column_id']
          t.serial_number = row['serial_number']
          t.model = row['model']
          t.atype = row['atype']
          t.status = row['status']
          t.installation_date = row['installation_date']
          t.last_inspection_date = row['last_inspection_date']
          t.inspection_certificate = row['inspection_certificate']
          t.information = row['information']
          t.notes = row['notes']
          t.created_at = row['created_at']
          t.updated_at = row['updated_at']

          t.save!
            
        end


        require 'csv'
        csv_text = File.read(Rails.root.join('lib', 'seed', 'quote.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|   
            t = Quote.new
            t.id = row['Id']
            t.created_at = row['created_at']
            t.updated_at = row['updated_at']
            t.full_name = row['full_name']
            t.phone_number = row['phone_number']
            t.email = row['email']
            t.business_name = row['business_name']
            t.building_type = row['building_type']
            t.quality = row['quality']
            t.elevator_price = row['elevator_price']
            t.installation_price = row['installation_price']
            t.total_price = row['total_price']
            t.number_elevator = row['number_elevator']
            t.number_appartment = row['number_appartment']
            t.number_floor = row['number_floor']
            t.number_basement = row['number_basement']
            t.number_parking_space = row['number_parking_space']
            t.maximum_occupant_per_floor = row['maximum_occupant_per_floor']
            t.hour_of_activity = row['hour_of_activity']
            t.number_of_elevators_cage = row['number_of_elevators_cage']
            t.number_of_trade_market = row['number_of_trade_market']
            t.number_of_distinct_business = row['number_of_distinct_business']

            t.save!
              
          end


          
        