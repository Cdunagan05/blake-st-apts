class Owner < ActiveRecord::Base
  has_many :units

  def total_rent
    total = 0
    units.each do |unit|
      total += unit.monthly_rent
    end
    total
  end
end
