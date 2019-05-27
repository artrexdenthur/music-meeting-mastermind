module MembershipsHelper

  def get_formatted_parts(membership)
    return get_parts(membership).map { |p| p.to_s.capitalize }.join(', ')
  end

  def get_linked_parts(membership, chorus)
    link_arr = []
    target = chorus ? "/choruses/#{chorus.id}/" : "/singers/"
    get_parts(membership).each do |p|
      link_arr << link_to(p.to_s.capitalize, "#{target}#{p.to_s.pluralize}")
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
    user_signed_in? && (current_user.choruses.include?(chorus) || current_user.admin)
  end
  
end