class Business < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  has_attached_file :image, :styles => { :medium => "150x", :thumb => "100x100>" }, :default_url => "default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


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

