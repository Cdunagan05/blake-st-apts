class Unit < ActiveRecord::Base
  has_one :renter

  def avg_per_sqft
    (monthly_rent.to_f/square_footage).round(2)
  end
end
