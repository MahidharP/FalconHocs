class RenameTypeInInterviews < ActiveRecord::Migration
    def change
        rename_column :interviews, :type, :kind
    end
end
