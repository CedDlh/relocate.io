require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointments_index_url
    assert_response :success
  end

  test "should get create" do
    get appointments_create_url
    assert_response :success
  end

  test "should get update" do
    get appointments_update_url
    assert_response :success
  end

  test "should get delte" do
    get appointments_delte_url
    assert_response :success
  end

end
