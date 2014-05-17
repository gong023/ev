class CreateLifelogAnimeticks < ActiveRecord::Migration
  def change
    create_table :lifelog_animeticks do |t|
      t.integer :evernote_uid, null: false
      t.string :access_token, null: false
      t.string :access_secret, null: false
      t.integer :status, default: 1

      t.timestamps
    end

    add_index "lifelog_animeticks", ["evernote_uid", "status"], name: "index_lifelog_animeticks_on_evernote_uid_and_status", using: :btree
    add_index "lifelog_animeticks", ["evernote_uid"], name: "index_lifelog_animeticks_on_evernote_uid", unique: true, using: :btree
  end
end
