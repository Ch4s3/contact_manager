class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  include Contact

  def to_s
  " #{first_name} #{last_name} "
  end

  belongs_to :user

end
