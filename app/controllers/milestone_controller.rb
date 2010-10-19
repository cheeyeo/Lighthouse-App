class MilestoneController < ApplicationController
  before_filter :setup_access
  before_filter :get_project
  
  def index
    # grabbing the most current milestone
    # we seek the current milestone using its due_on date greater than the current time
    @milestone = @project.milestones.select{|x| x.due_on!=nil && x.due_on >= Time.now}.first
    current_page = (params[:page].blank?)? 1 : params[:page]
    
    @tickets = Lighthouse::Ticket.find(:all, :params => {:page => current_page, :project_id => @project.id, :q=>"state:open milestone:#{@milestone.title} sort:number"})
  end

end
