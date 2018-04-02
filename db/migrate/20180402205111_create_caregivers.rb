class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|
    	t.string :email, null: false
    	t.string :first_name
    	t.string :last_name
    	t.string :address_line_one
    	t.string :address_line_two
    	t.string :city
    	t.string :province
    	t.string :country
    	t.string :postal_code
    	t.string :work_phone
    	t.string :house_phone
    	t.string :mobile_phone
    	t.timestamps
    end

    add_index :caregivers, :email, unique: true
  end
end
