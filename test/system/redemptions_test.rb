require "application_system_test_case"

class RedemptionsTest < ApplicationSystemTestCase
  setup do
    @redemption = redemptions(:one)
  end

  test "visiting the index" do
    visit redemptions_url
    assert_selector "h1", text: "Redemptions"
  end

  test "should create redemption" do
    visit redemptions_url
    click_on "New redemption"

    click_on "Create Redemption"

    assert_text "Redemption was successfully created"
    click_on "Back"
  end

  test "should update Redemption" do
    visit redemption_url(@redemption)
    click_on "Edit this redemption", match: :first

    click_on "Update Redemption"

    assert_text "Redemption was successfully updated"
    click_on "Back"
  end

  test "should destroy Redemption" do
    visit redemption_url(@redemption)
    click_on "Destroy this redemption", match: :first

    assert_text "Redemption was successfully destroyed"
  end
end
