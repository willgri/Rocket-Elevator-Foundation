require "application_system_test_case"

class Intervention1sTest < ApplicationSystemTestCase
  setup do
    @intervention1 = intervention1s(:one)
  end

  test "visiting the index" do
    visit intervention1s_url
    assert_selector "h1", text: "Intervention1s"
  end

  test "creating a Intervention1" do
    visit intervention1s_url
    click_on "New Intervention1"

    click_on "Create Intervention1"

    assert_text "Intervention1 was successfully created"
    click_on "Back"
  end

  test "updating a Intervention1" do
    visit intervention1s_url
    click_on "Edit", match: :first

    click_on "Update Intervention1"

    assert_text "Intervention1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention1" do
    visit intervention1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention1 was successfully destroyed"
  end
end
