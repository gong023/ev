class CreateLifelogLoggers < ActiveRecord::Migration
  def change
    create_table :lifelog_loggers do |t|
      t.integer :evernote_uid
      t.text :text
      t.string :type

      t.timestamps
    end
  end
end
