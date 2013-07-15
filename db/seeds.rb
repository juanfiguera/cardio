# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts HrmSession.count

hrmSessions = HrmSession.all

hrmSessions.each do |h|
	puts h.id
	h.minBpm = h.hrmDataPoints.minimum(:bpm) 
	h.maxBpm = h.hrmDataPoints.maximum(:bpm) 
	h.avgBpm = h.hrmDataPoints.average(:bpm)
	h.hr_zone_1_duration = h.hrmDataPoints.where('bpm >= ?',h.user.hr_zone1_bpm_min).where('bpm <= ?',h.user.hr_zone1_bpm_max).sum(:duration)
	h.hr_zone_2_duration = h.hrmDataPoints.where('bpm >= ?',h.user.hr_zone2_bpm_min).where('bpm <= ?',h.user.hr_zone2_bpm_max).sum(:duration)
	h.hr_zone_3_duration = h.hrmDataPoints.where('bpm >= ?',h.user.hr_zone3_bpm_min).where('bpm <= ?',h.user.hr_zone3_bpm_max).sum(:duration)
	h.save 
end