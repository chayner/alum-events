require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    attendee = Attendee.new(
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@example.com",
      phone_number: "1234567890",
      ug_graduation_year: 2020,
      ug_college: "College of Arts and Sciences",
      ug_program: "Computer Science",
      ug_degree: "BSc",
      gr_graduation_year: 2022,
      gr_college: "Graduate School",
      gr_program: "Software Engineering",
      gr_degree: "MSc",
      is_faculty: false,
      is_staff: false,
      company: "Tech Company",
      position: "Developer"
    )
    assert attendee.valid?
    assert_equal "alumni", attendee.category
  end

  test "should derive category as faculty" do
    attendee = Attendee.new(
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@example.com",
      is_faculty: true
    )
    assert_equal "faculty", attendee.category
  end

  test "should derive category as staff" do
    attendee = Attendee.new(
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@example.com",
      is_staff: true
    )
    assert_equal "staff", attendee.category
  end

  test "should derive category as guest" do
    attendee = Attendee.new(
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@example.com"
    )
    assert_equal "guest", attendee.category
  end
end