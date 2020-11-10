class CreatePickUpPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :pick_up_people do |t|

	      t.integer :user_id
	      t.string :family_name
	      t.string :family_name_kana
	      t.string :first_name
	      t.string :first_name_kana
	      t.date :birth_date
	      t.string :post_code
	      t.string :address
	      t.string :telephone
	      t.string :relationship

      t.timestamps
    end
  end
end
