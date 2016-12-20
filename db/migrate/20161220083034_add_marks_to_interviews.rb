class AddMarksToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :marks, :float
  end
end
