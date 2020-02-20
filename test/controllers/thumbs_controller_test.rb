require 'test_helper'

class ThumbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thumb = thumbs(:one)
  end

  test "should get index" do
    get thumbs_url, as: :json
    assert_response :success
  end

  test "should create thumb" do
    assert_difference('Thumb.count') do
      post thumbs_url, params: { thumb: { direction: @thumb.direction, showerthought_id: @thumb.showerthought_id, user_id: @thumb.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show thumb" do
    get thumb_url(@thumb), as: :json
    assert_response :success
  end

  test "should update thumb" do
    patch thumb_url(@thumb), params: { thumb: { direction: @thumb.direction, showerthought_id: @thumb.showerthought_id, user_id: @thumb.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy thumb" do
    assert_difference('Thumb.count', -1) do
      delete thumb_url(@thumb), as: :json
    end

    assert_response 204
  end
end
