class Special < ActiveRecord::Base
  validates_presence_of :name, :run_time

  belongs_to :comedian

  def self.average_run_time
    average(:run_time)
  end
end
