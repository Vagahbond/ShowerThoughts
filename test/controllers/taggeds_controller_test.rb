require 'test_helper'

class TaggedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tagged = taggeds(:one)
  end

  test "should get index" do
    get taggeds_url, as: :json
    assert_response :success
  end

  test "should create tagged" do
    assert_difference('Tagged.count') do
      post taggeds_url, params: { tagged: { showerthought_id: @tagged.showerthought_id, tag_id: @tagged.tag_id } }, as: :json
    end

    assert_response 201
  end

  test "should show tagged" do
    get tagged_url(@tagged), as: :json
    assert_response :success
  end

  test "should update tagged" do
    patch tagged_url(@tagged), params: { tagged: { showerthought_id: @tagged.showerthought_id, tag_id: @tagged.tag_id } }, as: :json
    assert_response 200
  end

  test "should destroy tagged" do
    assert_difference('Tagged.count', -1) do
      delete tagged_url(@tagged), as: :json
    end

    assert_response 204
  end
end
