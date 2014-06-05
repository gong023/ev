class RenameLoggerTypeColumn < ActiveRecord::Migration
  def change
    rename_column(:lifelog_loggers, :type, :occured)
    add_index :lifelog_loggers, :evernote_uid
    add_index :lifelog_loggers, :occured
  end
end
