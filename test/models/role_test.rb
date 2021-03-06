require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_presence_of(:role_name)
  should validate_uniqueness_of(:role_name)
  should have_many(:assignments)
  should have_many(:users).through(:assignments)
end
