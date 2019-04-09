class ChartsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_admin!

  
  # GET /charts
  def charts
    
    conn = PG::Connection.open(host: "localhost", port: 5432, dbname: "postgres", user: "postgres", password: "1234")
    # conn = PG::Connection.open(host: "localhost", port: 5432, dbname: "postgres", user: "postgres", password: "1234")

    @data1 = conn.exec ("SELECT business_name, numbers_of_elevators FROM dimcustomers 
      WHERE numbers_of_elevators > 0
      GROUP BY business_name, numbers_of_elevators
      ORDER BY numbers_of_elevators;")
   
    @x1 = @data1.column_values(0)
    @y1 = @data1.column_values(1)

    @data2  = conn.exec('SELECT extract(YEAR FROM created_at) AS YEAR, extract(MONTH FROM created_at) AS MONTH, COUNT(quote_id)
    FROM factquotes
    GROUP BY  YEAR, MONTH
    ORDER BY  YEAR, MONTH')
    @x2 = @data2.column_values(1)
    @y2 = @data2.column_values(2)

    @data3 = conn.exec('SELECT extract(YEAR FROM created_at) AS YEAR, extract(MONTH FROM created_at) AS MONTH, COUNT(id)
    FROM factcontact
    GROUP BY  YEAR, MONTH
    ORDER BY  YEAR, MONTH')
    @x3 = @data3.column_values(1)
    @y3 = @data3.column_values(2)
    
  
  end
  
end
  