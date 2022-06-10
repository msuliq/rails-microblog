# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  # Verify validity of internal links
  test 'layout links for unregistered viewer' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    get signup_path
    assert_select 'title', full_title('Sign up')
  end

  # Verify validity of links for logged in users
  test 'layout links for logged in user' do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', edit_user_path(@user)
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', logout_path

    get signup_path
    assert_select 'title', full_title('Sign up')
  end
end
