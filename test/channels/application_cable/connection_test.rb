# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Lint/EmptyClass
class ApplicationCable < ActionCable::Connection::TestCase
  class ConnectionTest
    # test "connects with cookies" do
    #   cookies.signed[:user_id] = 42
    #
    #   connect
    #
    #   assert_equal connection.user_id, "42"
    # end
  end
end
# rubocop:enable Lint/EmptyClass
