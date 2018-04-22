class Questionnaire < ActiveRecord::Base
  belongs_to :age_group
  has_many :patient_questionnaires
  has_many :patients, :through => :patient_questionnaires

  validates :name, :file_path, :age_group, presence: true
  validates :file_path, uniqueness: true
  validate :name_age_group_unique

  private

  def name_age_group_unique
    if Questionnaire.find_by(name: name, age_group: age_group)
      errors.add(:name, "name and age group must be unique")
    end
  end
end
