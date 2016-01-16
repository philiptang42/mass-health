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

towns = []

CSV.foreach('mass-chip-data.csv', headers: true, header_converters: :symbol) do |row|
  town = row.to_hash
  towns << town
end

towns.each do |town|
  db_connection do |conn|
    city = town[:geography]
    total_population_in_2005 = town[:total_pop_year_2005]
    age_0_to_19_in_2005 = town[:age_019_year_2005]
    age_65_plus_in_2005 = town[:age_65_year_2005]
    per_capita_income_in_2000 = town[:per_capita_income_year_2000]
    persons_below_200_percent_poverty_in_2000 = town[:persons_living_below_200_poverty_year_2000]
    percentage_of_all_persons_below_200_poverty_in_2000 = town[:_all_persons_living_below_200_poverty_year_2000]
    percentage_adequacy_prenatal_care = town[:_adequacy_prenatal_care_kotelchuck]
    percentage_C_section_deliveries_2005_to_2008 = town[:_csection_deliveries_20052008]
    infant_deaths_2005_to_2008 = town[:number_of_infant_deaths_20052008]
    infant_mortality_rate_2005_to_2008 = town[:infant_mortality_rate_deaths_per_1000_live_births_20052008]
    percentage_low_birthrate_2005_to_2008 = town[:_low_birthweight20052008]
    percentage_multiple_births_2005_to_2008 = town[:_multiple_births_20052008]
    percentage_publically_financed_prenatal_care_2005_to_2008 = town[:_publicly_financed_prenatal_care_20052008]
    percentage_teen_births_2005_to_2008 = town[:_teen_births_20052008]

    conn.exec("INSERT INTO town_health_record (city, total_population_in_2005, age_0_to_19_in_2005, age_65_plus_in_2005, per_capita_income_in_2000, persons_below_200_percent_poverty_in_2000, percentage_of_all_persons_below_200_poverty_in_2000, percentage_adequacy_prenatal_care, percentage_C_section_deliveries_2005_to_2008, infant_deaths_2005_to_2008, infant_mortality_rate_2005_to_2008, percentage_low_birthrate_2005_to_2008, percentage_multiple_births_2005_to_2008, percentage_publically_financed_prenatal_care_2005_to_2008, percentage_teen_births_2005_to_2008)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)", [city, total_population_in_2005, age_0_to_19_in_2005, age_65_plus_in_2005, per_capita_income_in_2000, persons_below_200_percent_poverty_in_2000, percentage_of_all_persons_below_200_poverty_in_2000, percentage_adequacy_prenatal_care, percentage_C_section_deliveries_2005_to_2008, infant_deaths_2005_to_2008, infant_mortality_rate_2005_to_2008, percentage_low_birthrate_2005_to_2008, percentage_multiple_births_2005_to_2008, percentage_publically_financed_prenatal_care_2005_to_2008, percentage_teen_births_2005_to_2008]
  end
end
