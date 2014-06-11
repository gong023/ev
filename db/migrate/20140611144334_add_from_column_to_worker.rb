class AddFromColumnToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :from, :string
  end
end
