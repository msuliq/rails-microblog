# frozen_string_literal: true

# Application helper is included in test helper
# this test is designed to ensure proper functioning of full_title method

require 'test_helper'
class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title, 'Sample microblog app'
    assert_equal full_title('Help'), 'Help | Sample microblog app'
  end
end
