class Company < ActiveRecord::Base
  validates :name,  presence: true
  include Contact

  def to_s
  " #{name}"
  end

  belongs_to :user

end
