
require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seed', 'FactIntervention.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|   
    t = Intervention.new
    t.id = row['id']
    t.employee_id = row['employee_id']
    t.building_id = row['building_id']
    t.battery_id = row['battery_id']
    t.column_id = row['column_id']
    t.elevator_id = row['elevator_id']
    t.start_intervention_date_hour = row['start_intervention_date_hour']
    t.end_intervention_date_hour = row['end_intervention_date_hour']
    t.result = row['result']
    t.report = row['report']
    t.status = row['status']

    t.save!
      
  end

