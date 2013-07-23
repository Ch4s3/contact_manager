class PhoneNumber < ActiveRecord::Base

  before_validation(on: :create) do
    self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
  end
  before_validation(on: :update) do
    self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
  end

  belongs_to :contact, polymorphic: true
  validates :number, :contact_id, :contact_type, presence: true
  validates_length_of :number,
    :minimum => 7,
    :maximum => 11

end
