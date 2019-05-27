module MembershipsHelper

  def get_formatted_parts(membership)
    return get_parts(membership).map { |p| p.to_s.capitalize }.join(', ')
  end

  def get_linked_parts(membership)
    link_arr = []
    get_parts(membership).each do |p|
      link_arr << link_to(p.to_s.capitalize, "/choruses/#{membership.chorus_id}/#{p.to_s.pluralize}")
    end
    return safe_join(link_arr, ', '.html_safe)
  end

  def get_link
    link_to root_path
  end


  def get_parts(membership)
    parts = [:baritone, :bass, :lead, :tenor]
    true_parts = []
    parts.each do |p|
      if membership.send(p)
        true_parts << p 
      end
    end
    return true_parts
  end

  def get_membership(chorus, singer)
    Membership.find_by(chorus_id: chorus.id, singer_id: singer.id)
  end

  def chorus_admin(chorus)
    current_user.choruses.include?(chorus)
  end
  
end