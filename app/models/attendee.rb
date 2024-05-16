class Attendee < ApplicationRecord
    # belongs_to :event

    validates :first_name, presence: true
    validates :last_name, presence: true

    def category
        if ug_degree.present? || gr_degree.present?
          'alumni'
        elsif is_faculty
          'faculty'
        elsif is_staff
          'staff'
        else
          'guest'
        end
    end
end