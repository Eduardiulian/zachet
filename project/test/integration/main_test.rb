require 'test_helper'

class MainTest < ActionDispatch::IntegrationTest
  setup do
    post users_path, params: { user: { email: 'test@mail.ru', password: '1111', username:'test', headline:'Tubus' } }
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post session_create_url, params: { session: {  username:'hello', password: '1111' } }
    assert_redirected_to session_new_url
  end

  test 'user with correct credentials will be redirected to main page' do
    post session_create_url, params: { session: {  username:'test', password: '1111' } }
    assert_redirected_to "/"
  end

  test "should redirect from profile without auth" do
    get main_profile_url
    assert_redirected_to session_new_url
  end

  test 'should do to profile if authorized' do
    post session_create_url, params: { session: {  username:'test', password: '1111' } }
    get main_profile_url, params: { session: {  username:'test', password: '1111' } }
    assert_response :success
  end

  test 'should do to profile edit if authorized' do
    post session_create_url, params: { session: {  username:'test', password: '1111' } }
    get main_profile_url, params: { session: {  username:'test', password: '1111' } }
    assert_response :success
  end

  test 'should do to edit' do
    post session_create_url, params: { session: {  username:'test', password: '1111' } }
    get main_profile_edit_url
    assert_response :success
    post main_edit_url, params: { user: { email: 'new_test@mail.ru', password: '1111', username:'new_test', headline:'new_tubus'  } }
    assert_response :redirect
    assert_redirected_to main_profile_url
  end

  test 'can logout'  do
    post session_create_url, params: { session: {  username:'test', password: '1111' } }
    get main_profile_edit_url
    post main_edit_url, params: { user: { email: 'new_test@mail.ru', password: '1111', username:'new_test', headline:'new_tubus'  } }
    get '/logout'
    assert_redirected_to session_new_url
  end
end
