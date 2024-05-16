class ChangePrimaryKeyForAttendees < ActiveRecord::Migration[7.0]
  def change
    # Create a new table with the desired primary key
    create_table :new_attendees do |t|
      t.string :buid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.integer :ug_graduation_year
      t.string :ug_college
      t.string :ug_program
      t.string :ug_degree
      t.integer :gr_graduation_year
      t.string :gr_college
      t.string :gr_program
      t.string :gr_degree
      t.string :category
      t.string :company
      t.string :position
      t.timestamp :checked_in
      t.timestamp :printed
    end

    # Drop the old table
    drop_table :attendees

    # Rename the new table to the old table's name
    rename_table :new_attendees, :attendees
  end
end
