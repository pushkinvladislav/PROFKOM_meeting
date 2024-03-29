require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Bilet", with: @student.bilet
    fill_in "Email", with: @student.email
    fill_in "Faculty", with: @student.faculty
    fill_in "First name", with: @student.first_name
    fill_in "Group", with: @student.group
    fill_in "Phone", with: @student.phone
    fill_in "Second name", with: @student.second_name
    check "Visit" if @student.visit
    fill_in "Vk", with: @student.vk_id
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Bilet", with: @student.bilet
    fill_in "Email", with: @student.email
    fill_in "Faculty", with: @student.faculty
    fill_in "First name", with: @student.first_name
    fill_in "Group", with: @student.group
    fill_in "Phone", with: @student.phone
    fill_in "Second name", with: @student.second_name
    check "Visit" if @student.visit
    fill_in "Vk", with: @student.vk_id
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
