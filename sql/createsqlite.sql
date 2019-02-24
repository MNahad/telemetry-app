pragma encoding = "UTF-8";

create table if not exists frames (
	"frame_id" integer primary key autoincrement not null,

	"downlink_time" timestamp not null default current_timestamp,
	"type" text check("type" in ('gps', 'imu', 'health', 'img', 'config')),
	"status" char(2),
	"payload" char(2),
	"hash" char(16),
	"crc" char(2),
	"frame_bin" varbinary(392)
);

create table if not exists status (
	"frame_id" integer unsigned,

	"spacecraft_id" char(2),
	"time" timestamp not null default current_timestamp,
	"time_source" boolean,
	"beacon_id" char(2),
	"obc_temperature" tinyint,
	"battery_temperature" tinyint,
	"battery_voltage" tinyint,
	"battery_current" tinyint unsigned,
	"charge_current" tinyint unsigned,
	"antenna_deployment" boolean,
	"operational_mode" tinyint,
	"data_pending" smallint unsigned,
	"reboot_count" tinyint unsigned,
	"rails_status_1" boolean,
	"rails_status_2" boolean,
	"rails_status_3" boolean,
	"rails_status_4" boolean,
	"rails_status_5" boolean,
	"rails_status_6" boolean,
	"rx_temperature" tinyint,
	"tx_temperature" tinyint,
	"pa_temperature" tinyint,
	"rx_noisefloor" tinyint unsigned,

	foreign key ("frame_id") references frames("frame_id")
);

create table if not exists gps (
	"frame_id" integer unsigned,

	"dataset_id" char(2),
	"timestamp" timestamp not null default current_timestamp,
	"gps_time" timestamp not null default current_timestamp,
	"lat" real,
	"lon" real,
	"alt" real,
	"hdop" tinyint unsigned,
	"vdop" tinyint unsigned,
	"pdop" tinyint unsigned,
	"tdop" tinyint unsigned,

	foreign key ("frame_id") references frames("frame_id")
);

create table if not exists imu (
	"frame_id" integer unsigned,

	"dataset_id" char(2),
	"timestamp" timestamp not null default current_timestamp,
	"mag_x_1" smallint,
	"mag_x_2" smallint,
	"mag_x_3" smallint,
	"mag_x_4" smallint,
	"mag_x_5" smallint,
	"mag_y_1" smallint,
	"mag_y_2" smallint,
	"mag_y_3" smallint,
	"mag_y_4" smallint,
	"mag_y_5" smallint,
	"mag_z_1" smallint,
	"mag_z_2" smallint,
	"mag_z_3" smallint,
	"mag_z_4" smallint,
	"mag_z_5" smallint,
	"gyro_x_1" smallint,
	"gyro_x_2" smallint,
	"gyro_x_3" smallint,
	"gyro_x_4" smallint,
	"gyro_x_5" smallint,
	"gyro_y_1" smallint,
	"gyro_y_2" smallint,
	"gyro_y_3" smallint,
	"gyro_y_4" smallint,
	"gyro_y_5" smallint,
	"gyro_z_1" smallint,
	"gyro_z_2" smallint,
	"gyro_z_3" smallint,
	"gyro_z_4" smallint,
	"gyro_z_5" smallint,
	"accel_x_1" smallint,
	"accel_x_2" smallint,
	"accel_x_3" smallint,
	"accel_x_4" smallint,
	"accel_x_5" smallint,
	"accel_y_1" smallint,
	"accel_y_2" smallint,
	"accel_y_3" smallint,
	"accel_y_4" smallint,
	"accel_y_5" smallint,
	"accel_z_1" smallint,
	"accel_z_2" smallint,
	"accel_z_3" smallint,
	"accel_z_4" smallint,
	"accel_z_5" smallint,

	foreign key ("frame_id") references frames("frame_id")
);

create table if not exists health (
	"frame_id" integer unsigned,

	"dataset_id" char(2),
	"timestamp" timestamp not null default current_timestamp,
	"obc_temperature" tinyint,
	"rx_temperature" tinyint,
	"tx_temperature" tinyint,
	"pa_temperature" tinyint,
	"reboot_count" tinyint unsigned,
	"data_packets_pending" smallint unsigned,
	"antenna_switch" boolean,
	"rx_noisefloor" tinyint unsigned,
	"detected_flash_errors" tinyint unsigned,
	"detected_ram_errors" tinyint unsigned,
	"battery_voltage" smallint,
	"battery_current" smallint unsigned,
	"battery_temperature" smallint,
	"charge_current" smallint unsigned,
	"mppt_voltage" smallint,
	"solar_n1_current" smallint unsigned,
	"solar_n2_current" smallint unsigned,
	"solar_e1_current" smallint unsigned,
	"solar_e2_current" smallint unsigned,
	"solar_s1_current" smallint unsigned,
	"solar_s2_current" smallint unsigned,
	"solar_w1_current" smallint unsigned,
	"solar_w2_current" smallint unsigned,
	"solar_t1_current" smallint unsigned,
	"solar_t2_current" smallint unsigned,
	"rails_switch_status_1" boolean,
	"rails_switch_status_2" boolean,
	"rails_switch_status_3" boolean,
	"rails_switch_status_4" boolean,
	"rails_switch_status_5" boolean,
	"rails_switch_status_6" boolean,
	"rails_overcurrent_status_1" boolean,
	"rails_overcurrent_status_2" boolean,
	"rails_overcurrent_status_3" boolean,
	"rails_overcurrent_status_4" boolean,
	"rails_overcurrent_status_5" boolean,
	"rails_overcurrent_status_6" boolean,
	"rail_1_boot_count" smallint unsigned,
	"rail_1_overcurrent_count" smallint unsigned,
	"rail_1_voltage" smallint,
	"rail_1_current" smallint unsigned,
	"rail_2_boot_count" smallint unsigned,
	"rail_2_overcurrent_count" smallint unsigned,
	"rail_2_voltage" smallint,
	"rail_2_current" smallint unsigned,
	"rail_3_boot_count" smallint unsigned,
	"rail_3_overcurrent_count" smallint unsigned,
	"rail_3_voltage" smallint,
	"rail_3_current" smallint unsigned,
	"rail_4_boot_count" smallint unsigned,
	"rail_4_overcurrent_count" smallint unsigned,
	"rail_4_voltage" smallint,
	"rail_4_current" smallint unsigned,
	"rail_5_boot_count" smallint unsigned,
	"rail_5_overcurrent_count" smallint unsigned,
	"rail_5_voltage" smallint,
	"rail_5_current" smallint unsigned,
	"rail_6_boot_count" smallint unsigned,
	"rail_6_overcurrent_count" smallint unsigned,
	"rail_6_voltage" smallint,
	"rail_6_current" smallint unsigned,
	"3v3_voltage" smallint,
	"3v3_current" smallint unsigned,
	"5v_voltage" smallint,
	"5v_current" smallint unsigned,
	"eeprom_subsystem_ok" boolean,
	"fram_subsystem_ok" boolean,
	"camera_subsystem_ok" boolean,
	"gps_subsystem_ok" boolean,
	"imu_subsystem_ok" boolean,
	"transmitter_subsystem_ok" boolean,
	"receiver_subsystem_ok" boolean,
	"eps_subsystem_ok" boolean,
	"battery_subsystem_ok" boolean,
	"obc_tempsensor_ok" boolean,
	"pa_tempsensor_ok" boolean,
	"rx_tempsensor_ok" boolean,
	"tx_tempsensor_ok" boolean,
	"batt_tempsensor_ok" boolean,

	foreign key ("frame_id") references frames("frame_id")
);

create table if not exists img (
	"frame_id" integer unsigned,

	"dataset_id" char(2),
	"timestamp" timestamp not null default current_timestamp,
	"image_id" tinyint unsigned,
	"fragment_id" smallint unsigned,
	"num_fragments" smallint unsigned,
	"image_data" char(2),

	foreign key ("frame_id") references frames("frame_id")
);

create table if not exists config (
	"frame_id" integer unsigned,

	"dataset_id" char(2),
	"tx_enable" tinyint unsigned,
	"tx_interval" tinyint unsigned,
	"tx_interval_downlink" tinyint unsigned,
	"tx_datarate" tinyint unsigned,
	"tx_power" tinyint unsigned,
	"tx_overtemp" tinyint,
	"rx_overtemp" tinyint,
	"batt_overtemp" tinyint,
	"obc_overtemp" tinyint,
	"pa_overtemp" tinyint,
	"low_voltage_threshold" tinyint,
	"low_voltage_recovery" tinyint,
	"health_acquisition_interval" smallint unsigned,
	"configuration_acquisition_interval" smallint unsigned,
	"imu_acquisition_interval" smallint unsigned,
	"imu_sample_count" tinyint unsigned,
	"imu_sample_interval" tinyint unsigned,
	"gps_acquisition_interval" smallint unsigned,
	"gps_sample_count" tinyint unsigned,
	"gps_sample_interval" tinyint unsigned,
	"image_acquisition_time" timestamp not null default current_timestamp,
	"image_acquisition_profile" tinyint unsigned,
	"time" timestamp not null default current_timestamp,
	"operational_mode" tinyint unsigned,
	"self_test" boolean,
	"power_rail_1" boolean,
	"power_rail_2" boolean,
	"power_rail_3" boolean,
	"power_rail_4" boolean,
	"power_rail_5" boolean,
	"power_rail_6" boolean,
	"reset_power_rail_1" boolean,
	"reset_power_rail_2" boolean,
	"reset_power_rail_3" boolean,
	"reset_power_rail_4" boolean,
	"reset_power_rail_5" boolean,
	"reset_power_rail_6" boolean,

	foreign key ("frame_id") references frames("frame_id")
);

