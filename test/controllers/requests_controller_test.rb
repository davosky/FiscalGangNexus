require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get requests_url
    assert_response :success
  end

  test "should get new" do
    get new_request_url
    assert_response :success
  end

  test "should create request" do
    assert_difference("Request.count") do
      post requests_url, params: { request: { category_id: @request.category_id, date: @request.date, email: @request.email, first_call: @request.first_call, first_call_date: @request.first_call_date, first_call_updater: @request.first_call_updater, first_name: @request.first_name, last_name: @request.last_name, mobile: @request.mobile, name: @request.name, note: @request.note, operator_id: @request.operator_id, practice_id: @request.practice_id, processed: @request.processed, second_call: @request.second_call, second_call_date: @request.second_call_date, second_call_updater: @request.second_call_updater, subscriber: @request.subscriber, third_call: @request.third_call, third_call_date: @request.third_call_date, third_call_updater: @request.third_call_updater, unprocessable: @request.unprocessable, unprocessable_reason: @request.unprocessable_reason, updater: @request.updater } }
    end

    assert_redirected_to request_url(Request.last)
  end

  test "should show request" do
    get request_url(@request)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_url(@request)
    assert_response :success
  end

  test "should update request" do
    patch request_url(@request), params: { request: { category_id: @request.category_id, date: @request.date, email: @request.email, first_call: @request.first_call, first_call_date: @request.first_call_date, first_call_updater: @request.first_call_updater, first_name: @request.first_name, last_name: @request.last_name, mobile: @request.mobile, name: @request.name, note: @request.note, operator_id: @request.operator_id, practice_id: @request.practice_id, processed: @request.processed, second_call: @request.second_call, second_call_date: @request.second_call_date, second_call_updater: @request.second_call_updater, subscriber: @request.subscriber, third_call: @request.third_call, third_call_date: @request.third_call_date, third_call_updater: @request.third_call_updater, unprocessable: @request.unprocessable, unprocessable_reason: @request.unprocessable_reason, updater: @request.updater } }
    assert_redirected_to request_url(@request)
  end

  test "should destroy request" do
    assert_difference("Request.count", -1) do
      delete request_url(@request)
    end

    assert_redirected_to requests_url
  end
end
