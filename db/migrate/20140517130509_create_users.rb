class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :evernote_uid, null: false
      t.integer :status, default: 1

      t.timestamps
    end

    add_index "users", ["evernote_uid", "status"], name: "index_users_on_evernote_uid_and_status", using: :btree
    add_index "users", ["evernote_uid"], name: "index_users_on_evernote_uid", unique: true, using: :btree
  end
end
