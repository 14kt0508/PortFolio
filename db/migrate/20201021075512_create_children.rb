class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.integer :user_id
      t.string :family_name
      t.string :family_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.date :birth_date
      t.integer :class_name_id
      t.string :pick_up_person
      t.time :pick_up_time
      t.string :allergies
      t.text :remarks

      t.timestamps
    end
  end
end
