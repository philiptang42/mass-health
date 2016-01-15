-- DEFINE YOUR DATABASE SCHEMA HERE
CREATE TABLE town_health_records (
  id serial PRIMARY KEY,
  geography varchar(255),
  total_population_in_2005 integer,
  age_0_to_19_in_2005 integer,
  age_65_plus_in_2005 integer,
  per_capita_income_in_2000 varchar(255),
  persons_below_200_percent_poverty_in_2000 varchar(255),
  percentage_of_all_persons_below_200_poverty_in_2000 varchar(255),
  percentage_adequacy_prenatal_care varchar(255),
  percentage_C_section_deliveries_2005_to_2008 varchar(255),
  infant_deaths_2005_to_2008 varchar(255),
  infant_mortality_rate_2005_to_2008 varchar(255),
  percentage_low_birthrate_2005_to_2008 varchar(255),
  percentage_multiple_births_2005_to_2008 varchar(255),
  percentage_publically_financed_prenatal_care_2005_to_2008 varchar(255),
  percentage_teen_births_2005_to_2008 varchar(255)
);
