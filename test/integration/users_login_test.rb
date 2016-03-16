require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login with invalid information' do
    get login_path
    post login_path, session: { email: '', password: '' }

    get root_path
    assert flash.empty?
  end
end
