module HrmSessionsHelper

 	# gets zone duration percentages on hrm_sessions/show.html.erb 
	def get_percentage_for(zone_duration) 
		p = HrmSession.sum(zone_duration).to_f / 
 				(HrmSession.sum(:hr_zone_1_duration) + 
 				 HrmSession.sum(:hr_zone_2_duration) + 
 				 HrmSession.sum(:hr_zone_3_duration)).to_f  
 		return "%0.2f" % (p * 100)
 	end

 	# creates dataset array on hrm_sessions/show.html.erb 
 	def getArray(h)
 	  hrmf = h.hrmDataPoints
  	@array = []
  	hrmf.each do |h| 
			 @array.push(h.bpm) 		
  	end
  	return @array
  end
end
