DWH_BI = YAML::load(ERB.new(File.read(Rails.root.join("config","dwh_database.yml"))).result)[Rails.env]
