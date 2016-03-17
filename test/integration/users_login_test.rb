require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'login with invalid information' do
    get login_path
    post login_path, session: { email: '', password: '' }

    get root_path
    assert flash.empty?
  end

  test 'login with valid information followed by logout' do
    get login_path

    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
  end
end
