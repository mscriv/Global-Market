class AddDepartmentRefToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :department, index: true
  end
end
