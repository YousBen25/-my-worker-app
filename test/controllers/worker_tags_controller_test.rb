require 'test_helper'

class WorkerTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get worker_tags_create_url
    assert_response :success
  end

end
