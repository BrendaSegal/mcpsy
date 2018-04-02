class CreateQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires do |t|
    	t.string :name, null: false
    	t.string :file_path, null: false
    	t.references :age_group, foreign: true, null: false
    	t.timestamps
    end

    add_index :questionnaires, :name, unique: true
    add_index :questionnaires, :file_path, unique: true
  end
end
