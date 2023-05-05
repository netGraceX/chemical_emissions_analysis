CREATE DATABASE db_emissions;
CREATE SCHEMA IF NOT EXISTS db_emissions_schema

-- create tables 

CREATE TABLE atm_table (
	id SERIAL PRIMARY KEY,
	name TEXT NULL
);

-- same for other atms
DROP TABLE IF EXISTS "ATM05";
CREATE TABLE ATM05 (
	atm_id INTEGER,
	data TIMESTAMPTZ NOT NULL,
	trs_ppb DOUBLE PRECISION NULL,
	trs_ug_m3 DOUBLE PRECISION NULL,
	trs_stato TEXT NULL,
	voc_ppb DOUBLE PRECISION NULL,	
	voc_stato TEXT NULL,
	c6h6_ppb DOUBLE PRECISION NULL,
	c6h6_ug_m3 DOUBLE PRECISION NULL,
	c6h6_stato TEXT NULL,
	h2s_ppb DOUBLE PRECISION NULL,
	h2s_ug_m3 DOUBLE PRECISION NULL,
	h2s_stato TEXT NULL,
	pidvoc_ppb DOUBLE PRECISION NULL,	
	pidvoc_stato TEXT NULL,
	FOREIGN KEY (atm_id) REFERENCES atm_table (id)
);

DROP TABLE IF EXISTS "weather_data";
CREATE TABLE weather_data (
	date TIMESTAMPTZ NOT NULL,
	wind_speed DOUBLE PRECISION NULL,
	wind_direction DOUBLE PRECISION NULL,
	temperature DOUBLE PRECISION NULL,
	radiation DOUBLE PRECISION NULL,
	pressure DOUBLE PRECISION NULL,
	precipitation DOUBLE PRECISION NULL,
	humidity DOUBLE PRECISION NULL
);

-- table --> hypertable (for time series - TimescaleDB)
SELECT create_hypertable('ATM05', 'date_time')
SELECT create_hypertable('weather_data', 'date_time')