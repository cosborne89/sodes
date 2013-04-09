class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.boolean :meeting
      t.string :title
      t.date :event_date
      t.time :begin_time
      t.time :end_time
      t.string :attendees
      t.text :body

      t.timestamps
    end
  end
end
