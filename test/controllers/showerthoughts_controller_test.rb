require 'test_helper'

class ShowerthoughtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showerthought = showerthoughts(:one)
  end

  test "should get index" do
    get showerthoughts_url, as: :json
    assert_response :success
  end

  test "should create showerthought" do
    assert_difference('Showerthought.count') do
      post showerthoughts_url, params: { showerthought: { content: @showerthought.content, context: @showerthought.context, user_id: @showerthought.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show showerthought" do
    get showerthought_url(@showerthought), as: :json
    assert_response :success
  end

  test "should update showerthought" do
    patch showerthought_url(@showerthought), params: { showerthought: { content: @showerthought.content, context: @showerthought.context, user_id: @showerthought.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy showerthought" do
    assert_difference('Showerthought.count', -1) do
      delete showerthought_url(@showerthought), as: :json
    end

    assert_response 204
  end
end
