# frozen_string_literal: true

require 'test_helper'
include Pagy::Backend

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:dwight)
    @admin = users(:michael) # Michael is set admin in fixtures
    @non_admin = users(:pam)
  end

  # Test involves only users with no difference whether admin or not
  test 'index including pagination' do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.pagination'
    _pagy, users = pagy(User.all, page: 1)
    users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end

  # Following tests differentiate admins and non-admins
  test 'index as admin including pagination and delete links' do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.pagination'
    _pagy, first_page_of_users = pagy(User.all, page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete',
                                                    method: :delete
      end
    end

    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test 'index as non-admin' do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
