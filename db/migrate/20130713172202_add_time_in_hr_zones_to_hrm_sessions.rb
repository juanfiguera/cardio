class AddTimeInHrZonesToHrmSessions < ActiveRecord::Migration
  def change
  	add_column :hrm_sessions, :hr_zone_1_duration, :integer
  	add_column :hrm_sessions, :hr_zone_2_duration, :integer
  	add_column :hrm_sessions, :hr_zone_3_duration, :integer
  end
end
