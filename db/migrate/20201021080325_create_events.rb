class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :time
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
