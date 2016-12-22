class AddEndDateToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :end_slot, :datetime
    rename_column :interviews, :slot, :start_slot
  end
end
