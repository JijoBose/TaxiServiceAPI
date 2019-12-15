require "application_system_test_case"

class Api::V1::RidesTest < ApplicationSystemTestCase
  setup do
    @api_v1_ride = api_v1_rides(:one)
  end

  test "visiting the index" do
    visit api_v1_rides_url
    assert_selector "h1", text: "Api/V1/Rides"
  end

  test "creating a Ride" do
    visit api_v1_rides_url
    click_on "New Api/V1/Ride"

    click_on "Create Ride"

    assert_text "Ride was successfully created"
    click_on "Back"
  end

  test "updating a Ride" do
    visit api_v1_rides_url
    click_on "Edit", match: :first

    click_on "Update Ride"

    assert_text "Ride was successfully updated"
    click_on "Back"
  end

  test "destroying a Ride" do
    visit api_v1_rides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ride was successfully destroyed"
  end
end
