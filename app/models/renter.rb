class Renter < ActiveRecord::Base
  belongs_to :unit

  def self.average_cost_per_sqft_for_all
    total = 0
    self.all.each do |renter|
      total += (renter.unit.monthly_rent.to_f/renter.unit.square_footage).round(2)
    end
    (total / self.all.length).round(2)
  end
end
