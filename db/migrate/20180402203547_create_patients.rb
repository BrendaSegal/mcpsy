class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.decimal :weight
    	t.date :birthdate
    	t.references :age_group, foreign: true, null: false
    	t.text :caregiver_note
    	t.text :doctor_note
    	t.text :hidden_note
    	t.references :caregiver, foreign: true, null: false
      t.timestamps
    end
  end
end
