class Survey < ActiveRecord::Base
  attr_accessible :operating_system, :use_turpial, :want_mac, :why_not

  def humanize_want_mac
    self.want_mac == 0 ? 'No' : self.want_mac == 1 ? 'Yes' : 'Dont care'
  end
end
