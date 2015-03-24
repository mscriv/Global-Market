class AddCategoryReftoBusinesses < ActiveRecord::Migration
  def change
    add_reference :businesses, :category, index: true
  end
end
