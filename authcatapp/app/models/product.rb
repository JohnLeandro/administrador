class Product < ActiveRecord::Base
  belongs_to :category
                   
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :picture, attachment_presence: true, presence: true
  validates_attachment :picture,
    content_type: { 
      content_type: ["image/jpeg", "image/gif", "image/png"] }
      
  def category_name
    self.category.name
  end
  
  def picture_url
    self.picture.url(:medium)
  end
end
