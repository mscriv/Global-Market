class AddBusinessIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :business_id, :integer
  end
end
