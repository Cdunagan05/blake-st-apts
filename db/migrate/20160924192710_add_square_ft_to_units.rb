class AddSquareFtToUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :square_footage, :integer
    add_column :units, :monthly_rent, :integer
  end
end
