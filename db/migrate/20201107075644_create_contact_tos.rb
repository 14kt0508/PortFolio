class CreateContactTos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_tos do |t|
    	t.integer :user_id
      	t.integer :class_name_id
      	t.integer :contact_id
      	t.timestamps
    end
  end
end
