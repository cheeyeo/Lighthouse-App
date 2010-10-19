module ApplicationHelper
  def setup_access
    # define access to rails account on lighthouse
    # not using authentication since we are only going to read the data...
    Lighthouse.account ='rails'
  end
  
  def get_project
    @project ||= Lighthouse::Project.find(8994)
  end
  
  def ticket_count
    get_project.open_tickets_count.to_i
  end
end
