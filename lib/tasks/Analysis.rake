require 'pg'
namespace :analysis do
  desc "Connection task"
      task data: :environment do
        conn = PG::Connection.open(host: "localhost", port: 5432, dbname: "postgres", user: "postgres", password: "vlwnpqxc1")

        rs = conn.exec (" SELECT * FROM factquotes")

        puts("Puts")
        puts(rs)
        puts("Puts")
        
        
       
       
          
    end     
end
