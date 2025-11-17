require "test_helper"

class CastingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casting = castings(:one)
  end

  test "should get index" do
    get castings_url, as: :json
    assert_response :success
  end

  test "should create casting" do
    assert_difference("Casting.count") do
      post castings_url, params: { casting: { movie_id: @casting.movie_id, person_id: @casting.person_id, role_name: @casting.role_name } }, as: :json
    end

    assert_response :created
  end

  test "should show casting" do
    get casting_url(@casting), as: :json
    assert_response :success
  end

  test "should update casting" do
    patch casting_url(@casting), params: { casting: { movie_id: @casting.movie_id, person_id: @casting.person_id, role_name: @casting.role_name } }, as: :json
    assert_response :success
  end

  test "should destroy casting" do
    assert_difference("Casting.count", -1) do
      delete casting_url(@casting), as: :json
    end

    assert_response :no_content
  end
end
