require 'csv'
require 'csv'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname = "mass_health")
    yield(connection)
  ensure
    connection.close
  end
end

def to_integer(number)
  delete_comma = number.delete(",")
  integer = delete_comma.to_i
  integer
end

def insert_records(town, formatted_numbers)

  record = [
    town['Geography'],
    formatted_numbers[:geography],
    formatted_numbers[:age_19_below],
    formatted_numbers[:age_65_plus],
    town["Per Capita income, year 2000"],
    formatted_numbers[:persons_below_200],
    town["% all Persons Living Below 200% Poverty Level, year 2000"],
    


  ]
