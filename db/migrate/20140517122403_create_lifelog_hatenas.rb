class CreateLifelogHatenas < ActiveRecord::Migration
  def change
    create_table :lifelog_hatenas do |t|
      t.integer :evernote_uid, null: false
      t.string :access_token, null: false
      t.string :access_secret, null: false
      t.integer :status, default: 1

      t.timestamps
    end

    add_index "lifelog_hatenas", ["evernote_uid", "status"], name: "index_lifelog_hatenas_on_evernote_uid_and_status", using: :btree
    add_index "lifelog_hatenas", ["evernote_uid"], name: "index_lifelog_hatenas_on_evernote_uid", unique: true, using: :btree
  end
end
