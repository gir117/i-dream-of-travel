class Visit < ActiveRecord::Base
  belongs_to(:location)
  belongs_to(:user)

  def to_s
    'blah'
  end

end
