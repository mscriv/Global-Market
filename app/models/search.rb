class Search < ActiveRecord::Base
  def businesses
    @businesses ||= find_businesses
  end

  private

  def find_businesses
    businesses = Business.order(:address)
    businesses = businesses.where("address like ?", "%#{keywords}%") if keywords.present?
    businesses = businesses.where(category_id: category_id) if category_id.present?

    businesses
  end
end
