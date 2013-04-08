class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  before_save :add_points

  def add_points
    user = self.user
    points = user.total_karma
    user.update_attribute(:total_karma, (points + self.value) )
  end

end
