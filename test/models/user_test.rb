require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:assignments)
  should have_many(:roles).through(:assignments)
end
