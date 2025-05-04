require "application_system_test_case"

class EarnedPointsTest < ApplicationSystemTestCase
  setup do
    @earned_point = earned_points(:one)
  end

  test "visiting the index" do
    visit earned_points_url
    assert_selector "h1", text: "Earned points"
  end

  test "should create earned point" do
    visit earned_points_url
    click_on "New earned point"

    click_on "Create Earned point"

    assert_text "Earned point was successfully created"
    click_on "Back"
  end

  test "should update Earned point" do
    visit earned_point_url(@earned_point)
    click_on "Edit this earned point", match: :first

    click_on "Update Earned point"

    assert_text "Earned point was successfully updated"
    click_on "Back"
  end

  test "should destroy Earned point" do
    visit earned_point_url(@earned_point)
    click_on "Destroy this earned point", match: :first

    assert_text "Earned point was successfully destroyed"
  end
end
