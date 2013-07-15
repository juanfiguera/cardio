class HrmSession < ActiveRecord::Base
	has_many :hrmDataPoints, dependent: :destroy 
	belongs_to :user

	scope :most_recent, order("created_at desc")
end