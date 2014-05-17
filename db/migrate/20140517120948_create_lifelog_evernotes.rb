class CreateLifelogEvernotes < ActiveRecord::Migration
  def change
    create_table :lifelog_evernotes do |t|
      t.integer :uid, null: false
      t.string :access_secret, null: false
      t.string :notebook, default: 'lifelog'
      t.integer :status, default: 1

      t.timestamps
    end

    add_index :lifelog_evernotes, ['uid', 'status'], name: 'index_lifelog_evernotes_on_uid_and_status', using: :btree
    add_index :lifelog_evernotes, ['uid'], name: 'index_lifelog_evernotes_on_uid', unique: true, using: :btree
  end
end
