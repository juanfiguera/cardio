class User < ActiveRecord::Base
	has_many :hrmSessions, dependent: :destroy 
end