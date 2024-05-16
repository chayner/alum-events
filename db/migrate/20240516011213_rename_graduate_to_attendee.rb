class RenameGraduateToAttendee < ActiveRecord::Migration[7.0]
  def change
    rename_table :graduates, :attendees
  end
end
