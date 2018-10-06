class Comedian < ActiveRecord::Base
  validates_presence_of :name, :age, :city

  has_many :specials

  def self.average_age
    average(:age)
  end

  def self.total_specials
    sum(:specials)
  end

  def self.average_run_time
    average(specials[:run_time])
  end

  def self.cities
    pluck(:city)
  end
end
