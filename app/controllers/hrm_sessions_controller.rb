class HrmSessionsController < ApplicationController
  def index
  	@hrmSessions = HrmSession.most_recent.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  	@hrmSession = HrmSession.find(params[:id])
  end
end

