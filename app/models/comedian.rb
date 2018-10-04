class Comedian < ActiveRecord::Base
  validates_presence_of :name, :age, :city

  has_many :specials

  def self.average_age
    average(:age)
  end

  def self.total_specials
    sum(:specials.count)
  end
end
