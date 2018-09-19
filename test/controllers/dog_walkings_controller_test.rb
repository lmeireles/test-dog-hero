require 'test_helper'

class DogWalkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog_walking = dog_walkings(:one)
  end

  test "should get index" do
    get dog_walkings_url, as: :json
    assert_response :success
  end

  test "should create dog_walking" do
    assert_difference('DogWalking.count') do
      post dog_walkings_url, params: { dog_walking: { duration: @dog_walking.duration, ended_at: @dog_walking.ended_at, lat: @dog_walking.lat, lng: @dog_walking.lng, pets_id: @dog_walking.pets_id, price: @dog_walking.price, scheduled_to: @dog_walking.scheduled_to, started_at: @dog_walking.started_at, status: @dog_walking.status } }, as: :json
    end

    assert_response 201
  end

  test "should show dog_walking" do
    get dog_walking_url(@dog_walking), as: :json
    assert_response :success
  end

  test "should update dog_walking" do
    patch dog_walking_url(@dog_walking), params: { dog_walking: { duration: @dog_walking.duration, ended_at: @dog_walking.ended_at, lat: @dog_walking.lat, lng: @dog_walking.lng, pets_id: @dog_walking.pets_id, price: @dog_walking.price, scheduled_to: @dog_walking.scheduled_to, started_at: @dog_walking.started_at, status: @dog_walking.status } }, as: :json
    assert_response 200
  end

  test "should destroy dog_walking" do
    assert_difference('DogWalking.count', -1) do
      delete dog_walking_url(@dog_walking), as: :json
    end

    assert_response 204
  end
end
