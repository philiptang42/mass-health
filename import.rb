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

def insert_records(town, formatted_info)

  record = [
    town['Geography'],
    
  ]
