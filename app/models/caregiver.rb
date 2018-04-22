class Caregiver < ActiveRecord::Base
  has_many :patients

  before_validation :format_postal_code

  # email/phone pattern matchers taken from internet
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :postal_code, format: /\A[a-z]\d[a-z]\d[a-z]\d\z/, allow_blank: true
  validates :work_phone, :house_phone, :mobile_phone, allow_blank: true,
    format: /\A^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$\z/

  private

  def format_postal_code
    self.postal_code = postal_code.gsub(/\s+/, "").downcase if postal_code.present?
  end
end
