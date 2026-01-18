require "application_system_test_case"

class EnrolmentsTest < ApplicationSystemTestCase
  setup do
    @enrolment = enrolments(:one)
  end

  test "should create enrolment" do
    visit new_enrolment_url

    click_on "Submit Application"

    assert_text "Enrolment was successfully created"
    click_on "Back"
  end

  test "should update Enrolment" do
    visit enrolment_url(@enrolment)
    click_on "Edit this enrolment", match: :first

    click_on "Update Enrolment"

    assert_text "Enrolment was successfully updated"
    click_on "Back"
  end

  test "should destroy Enrolment" do
    visit enrolment_url(@enrolment)
    click_on "Destroy this enrolment", match: :first

    assert_text "Enrolment was successfully destroyed"
  end
end
