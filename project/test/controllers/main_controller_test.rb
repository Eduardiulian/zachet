require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_index_url
    assert_response :success
  end

  test "should redirect from profile without auth" do
    get main_profile_url
    assert_redirected_to session_new_url
  end

  test 'should redirect from profile edit without auth' do
    get main_profile_edit_url
    assert_redirected_to session_new_url
  end
end
