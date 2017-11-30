require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @community = Community.new(title: "Lorem ipsum", description: "test", id: 1, user_id: 1)
  end

  test "should be valid" do
    assert @community.valid?
  end

  test "user id should be present" do
    @community.user_id = nil
    assert_not @community.valid?
  end

  test "title should be present" do
    @community.title = "   "
    assert_not @community.valid?
  end

  test "description should be present" do
    @community.description = "   "
    assert_not @community.valid?
  end
end
