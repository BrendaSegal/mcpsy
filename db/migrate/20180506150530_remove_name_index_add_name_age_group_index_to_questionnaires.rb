class RemoveNameIndexAddNameAgeGroupIndexToQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    remove_index :questionnaires, :name
    add_index :questionnaires, [:name, :age_group_id], unique: true
  end
end
