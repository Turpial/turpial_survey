class Survey < ActiveRecord::Base
  attr_accessible :operating_system, :use_turpial, :want_mac, :why_not
end
