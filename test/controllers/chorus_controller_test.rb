require 'test_helper'

class ChorusControllerTest < ActionDispatch::IntegrationTest
  test "Admin user can create a chorus" do
    admin = build(:user, admin: true)
    sign_in admin
    visit(new_chorus_path)
    
  end
end
