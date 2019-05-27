module UsersHelper
  def gated_edit_button(resource, link, *resources)
    # byebug
    if user_signed_in? && (resource.user == current_user || resources.any? { |r| r.user == current_user} || current_user.admin)
      button_to "edit", link, class: "btn"
    end
  end
end
