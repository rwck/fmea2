class Issue < ActiveRecord::Base
  belongs_to :project
  has_one :user, :through => :project
end
