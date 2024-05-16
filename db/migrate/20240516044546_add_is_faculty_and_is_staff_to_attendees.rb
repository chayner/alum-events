class AddIsFacultyAndIsStaffToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :is_faculty, :boolean, default: false
    add_column :attendees, :is_staff, :boolean, default: false
  end
end
