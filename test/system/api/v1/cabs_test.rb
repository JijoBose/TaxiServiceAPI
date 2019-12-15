require "application_system_test_case"

class Api::V1::CabsTest < ApplicationSystemTestCase
  setup do
    @api_v1_cab = api_v1_cabs(:one)
  end

  test "visiting the index" do
    visit api_v1_cabs_url
    assert_selector "h1", text: "Api/V1/Cabs"
  end

  test "creating a Cab" do
    visit api_v1_cabs_url
    click_on "New Api/V1/Cab"

    click_on "Create Cab"

    assert_text "Cab was successfully created"
    click_on "Back"
  end

  test "updating a Cab" do
    visit api_v1_cabs_url
    click_on "Edit", match: :first

    click_on "Update Cab"

    assert_text "Cab was successfully updated"
    click_on "Back"
  end

  test "destroying a Cab" do
    visit api_v1_cabs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cab was successfully destroyed"
  end
end
