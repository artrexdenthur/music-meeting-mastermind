module UsersHelper
  def gated_edit_button(resource, *resources)
    # byebug
    if user_signed_in? && (resource.user == current_user || resources.any? { |r| r.user == current_user} || current_user.admin)
      link_to "edit", [:edit, resource]
    end
  end
end
