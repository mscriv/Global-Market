class Department < ActiveRecord::Base
  has_many :listings
end
