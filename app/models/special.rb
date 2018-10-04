class Special < ActiveRecord::Base
  validates_presence_of :name, :run_time, :thumbnail

  belongs_to :comedian
end
