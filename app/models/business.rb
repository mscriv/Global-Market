class Business < ActiveRecord::Base
  belongs_to :category


  def self.search(category, search)
    if search
      if category == nil
        where('address LIKE ?', "%#{search}%")
      else
        where("category_id = ? AND address like ?", category, "%#{search}%")

      end
        else
      all
    end
  end

end

