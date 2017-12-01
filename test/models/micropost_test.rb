require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum", artist: "test", title: "title", community_id: 1)
  end

  test "should be valid" do
    assert !@micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "artist should be present" do
    @micropost.artist = "   "
    assert_not @micropost.valid?
  end

  test "title should be present" do
    @micropost.title = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 1000 characters" do
    @micropost.content = "a" * 1001
    assert_not @micropost.valid?
  end
  
end
