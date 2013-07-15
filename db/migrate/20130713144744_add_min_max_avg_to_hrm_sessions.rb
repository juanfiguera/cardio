class AddMinMaxAvgToHrmSessions < ActiveRecord::Migration
  def change
  	add_column :hrm_sessions, :minBpm, :integer
  	add_column :hrm_sessions, :maxBpm, :integer
  	add_column :hrm_sessions, :avgBpm, :integer
  end
end
