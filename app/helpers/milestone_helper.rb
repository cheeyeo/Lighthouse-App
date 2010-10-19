module MilestoneHelper
  def generate_ticket_status_color(ticket)
    case ticket.attributes["state"]
      when "open"
        color_str = "topen"
      when "incomplete"
        color_str = "tincomplete"
      when "new"
        color_str = "tnew"
    end
    color_str
  end
  
  def generate_further_links(milestone)
    # generates the pagination at the bottom of each page
    # currently the LIGHTHOUSE API only returns 30 results by default
    # the only way to get the next set is to send a page=X request again back to the API
    # the method below tries to compute the number of pages required based on the total number of open tickets
    # and generates the link automatically
    
    # this is not really pagination as we know it where we split records up into groups
    # but an attempt to fetch the next relevant set of open tickets from Lighthouse
    total_tickets = milestone.open_tickets_count.to_i
    items_per_page = 30 # api default
    page = 1
    mod = total_tickets % items_per_page
    res = total_tickets / items_per_page
    arr=[]
    if mod < 1
      arr = 1.upto(res)
    else
      arr = 1.upto(res+1)
    end
    arr
  end
  
end
