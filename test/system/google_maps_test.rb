require "application_system_test_case"

class GoogleMapsTest < ApplicationSystemTestCase
  setup do
    @google_map = google_maps(:one)
  end

  test "visiting the index" do
    visit google_maps_url
    assert_selector "h1", text: "Google Maps"
  end

  test "creating a Google map" do
    visit google_maps_url
    click_on "New Google Map"

    click_on "Create Google map"

    assert_text "Google map was successfully created"
    click_on "Back"
  end

  test "updating a Google map" do
    visit google_maps_url
    click_on "Edit", match: :first

    click_on "Update Google map"

    assert_text "Google map was successfully updated"
    click_on "Back"
  end

  test "destroying a Google map" do
    visit google_maps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Google map was successfully destroyed"
  end
end
