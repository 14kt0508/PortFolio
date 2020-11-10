class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|

    	t.string :facility_name
    	t.string :email

      t.timestamps
    end
  end
end
