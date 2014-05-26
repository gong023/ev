class AddWorkersUidColumn < ActiveRecord::Migration
  def change
    add_column(:workers, :evernote_uid, :integer, null: false)
  end
end
