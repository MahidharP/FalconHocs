class AddLevelToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :level, :string 
  end
end
