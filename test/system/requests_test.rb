require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test "visiting the index" do
    visit requests_url
    assert_selector "h1", text: "Requests"
  end

  test "should create request" do
    visit requests_url
    click_on "New request"

    fill_in "Category", with: @request.category_id
    fill_in "Date", with: @request.date
    fill_in "Email", with: @request.email
    check "First call" if @request.first_call
    fill_in "First call date", with: @request.first_call_date
    fill_in "First call updater", with: @request.first_call_updater
    fill_in "First name", with: @request.first_name
    fill_in "Last name", with: @request.last_name
    fill_in "Mobile", with: @request.mobile
    fill_in "Name", with: @request.name
    fill_in "Note", with: @request.note
    fill_in "Operator", with: @request.operator_id
    fill_in "Practice", with: @request.practice_id
    check "Processed" if @request.processed
    check "Second call" if @request.second_call
    fill_in "Second call date", with: @request.second_call_date
    fill_in "Second call updater", with: @request.second_call_updater
    check "Subscriber" if @request.subscriber
    check "Third call" if @request.third_call
    fill_in "Third call date", with: @request.third_call_date
    fill_in "Third call updater", with: @request.third_call_updater
    check "Unprocessable" if @request.unprocessable
    fill_in "Unprocessable reason", with: @request.unprocessable_reason
    fill_in "Updater", with: @request.updater
    click_on "Create Request"

    assert_text "Request was successfully created"
    click_on "Back"
  end

  test "should update Request" do
    visit request_url(@request)
    click_on "Edit this request", match: :first

    fill_in "Category", with: @request.category_id
    fill_in "Date", with: @request.date
    fill_in "Email", with: @request.email
    check "First call" if @request.first_call
    fill_in "First call date", with: @request.first_call_date
    fill_in "First call updater", with: @request.first_call_updater
    fill_in "First name", with: @request.first_name
    fill_in "Last name", with: @request.last_name
    fill_in "Mobile", with: @request.mobile
    fill_in "Name", with: @request.name
    fill_in "Note", with: @request.note
    fill_in "Operator", with: @request.operator_id
    fill_in "Practice", with: @request.practice_id
    check "Processed" if @request.processed
    check "Second call" if @request.second_call
    fill_in "Second call date", with: @request.second_call_date
    fill_in "Second call updater", with: @request.second_call_updater
    check "Subscriber" if @request.subscriber
    check "Third call" if @request.third_call
    fill_in "Third call date", with: @request.third_call_date
    fill_in "Third call updater", with: @request.third_call_updater
    check "Unprocessable" if @request.unprocessable
    fill_in "Unprocessable reason", with: @request.unprocessable_reason
    fill_in "Updater", with: @request.updater
    click_on "Update Request"

    assert_text "Request was successfully updated"
    click_on "Back"
  end

  test "should destroy Request" do
    visit request_url(@request)
    click_on "Destroy this request", match: :first

    assert_text "Request was successfully destroyed"
  end
end
