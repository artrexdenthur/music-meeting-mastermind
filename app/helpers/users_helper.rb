module UsersHelper
  def gated_edit_button(resource)
    # byebug
    if (resource.user && (resource.user == current_user)) || (user_signed_in? && current_user.admin)
      link_to "edit", [:edit, resource]
    end
  end
end
