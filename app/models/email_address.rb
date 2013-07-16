class EmailAddress < ActiveRecord::Base
  belongs_to :contact, polymorphic: true
  validates :address, :person_id, presence: true
end
