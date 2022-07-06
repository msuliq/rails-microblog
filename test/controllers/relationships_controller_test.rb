# frozen_string_literal: true

require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  test 'create should require logged-in user' do
    assert_no_difference 'Relationship.count' do
      post :create
    end
    assert_template @feed_items
  end

  test 'destroy should require logged-in user' do
    assert_no_difference 'Relationship.count' do
      delete :destroy, params: { id: relationships(:one) }
    end
    assert_template @feed_items
  end
end
