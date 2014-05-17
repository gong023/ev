class CreateLifelogMoves < ActiveRecord::Migration
  def change
    create_table :lifelog_moves do |t|
      t.integer :evernote_uid, null: false
      t.string :access_secret, null: false
      t.integer :status, default: 1

      t.timestamps
    end

    add_index "lifelog_moves", ["evernote_uid", "status"], name: "index_lifelog_moves_on_evernote_uid_and_status", using: :btree
    add_index "lifelog_moves", ["evernote_uid"], name: "index_lifelog_moves_on_evernote_uid", unique: true, using: :btree
  end
end
