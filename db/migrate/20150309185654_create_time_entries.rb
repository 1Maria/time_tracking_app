class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.decimal :duration
      t.integer :project_id
      t.date :completed_on
      t.integer :developer_id

      t.timestamps null: false
    end
  end
end
