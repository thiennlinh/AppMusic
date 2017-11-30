require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @playlist = Playlist.new(id: 1, name: "Lorem ipsum", user_id: 1)
  end

  test "should be valid" do
    assert !@playlist.valid?
  end

  test "name should be present" do
    @playlist.name = "   "
    assert_not @playlist.valid?
  end

  test "user id should be present" do
    @playlist.user_id = nil
    assert_not @playlist.valid?
  end

end
