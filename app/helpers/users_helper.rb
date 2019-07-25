module UsersHelper
  def gated_edit_button(resource, link, *resources)
    # byebug
    if user_signed_in? && (resource.user == current_user || resources.any? { |r| r.user == current_user} || current_user.admin)
      button_to "edit", link, method: :get, class: "btn"
    end
  end

  def available_username(user)
    return user.profile.name unless user.profile.name.blank?
    return user.username unless user.username.blank?
    return user.email
  end
end
