require 'test_helper'

class WorkerProfileTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get worker_profile_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get worker_profile_tags_destroy_url
    assert_response :success
  end

end
