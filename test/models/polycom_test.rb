require 'test_helper'

class PolycomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @polycom = Polycom.new(id: 1, commentable_type: "Micropost", commentable_id: 1, user_id: 1, body: "lorem")
  end

  test "should be valid" do
    assert !@polycom.valid?
  end

  test "commentable type should be present" do
    @polycom.commentable_type = nil
    assert_not @polycom.valid?
  end

  test "commentable id should be present" do
    @polycom.commentable_id = nil
    assert_not @polycom.valid?
  end

  test "user id should be present" do
    @polycom.user_id = nil
    assert_not @polycom.valid?
  end

  test "body should be present" do
    @polycom.body = nil
    assert_not @polycom.valid?
  end

end
