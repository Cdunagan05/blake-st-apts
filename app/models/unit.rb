class Unit < ActiveRecord::Base
  has_one :renter

  def avg_per_sqft
    if monthly_rent == nil || square_footage == nil
      return 0
    else
    (monthly_rent.to_f/square_footage).round(2)
    end
  end
end
