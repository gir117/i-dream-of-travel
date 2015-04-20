class User < ActiveRecord::Base
  has_many(:visits)
  has_many(:locations, :through => :visits)

  def to_s
     self.username
  end

end
