require 'test_helper'

class WorkerProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worker_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get worker_profiles_show_url
    assert_response :success
  end

  test "should get new" do
    get worker_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get worker_profiles_create_url
    assert_response :success
  end

  test "should get edit" do
    get worker_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get worker_profiles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get worker_profiles_destroy_url
    assert_response :success
  end

end
