-- DEFINE YOUR DATABASE SCHEMA HERE
CREATE TABLE mass_health (
  id serial PRIMARY KEY,
  geography varchar(255),
  total_population_in_2005 integer,
  age_0-19_in_2005 integer,
  age_65+_in_2005 integer,
  per_capita_income_in_2000 currency varchar(255),
  persons_below_200%_poverty_in_2000 integer,
  %_of_all_persons_below_200%_poverty_in_2000 varchar(255),
  %_adequacy_prenatal_care varchar(255),
  %_C-section_deliveries_2005_to_2008 varchar(255),
  infant_deaths_2005_to_2008 varchar(255),
  infant_mortality_rate_2005_to_2008 varchar(255),
  %_low_brightrate_2005_to_2008 varchar(255),
  %_multiple_births_2005_to_2008 varchar(255),
  %_publically_financed_prenatal_care_2005_to_2008 varchar(255),
  %_teen_births_2005_to_2008 varchar(255)
);
