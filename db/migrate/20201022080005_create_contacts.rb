class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
    	t.integer :admin_id
    	t.datetime :time
    	t.string :title
    	t.text :body
    	t.string :image_id
		t.timestamps
    end
  end
end
