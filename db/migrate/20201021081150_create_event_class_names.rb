class CreateEventClassNames < ActiveRecord::Migration[5.2]
  def change
    create_table :event_class_names do |t|
      t.integer :event_id
      t.integer :class_name_id

      t.timestamps
    end
  end
end
