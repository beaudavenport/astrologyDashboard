class Service < ActiveRecord::Base
  
  include HTML_Sanitize
  
  before_save do
    self.description = sanitize(self.description)
    self.required_info = sanitize(self.required_info)
  end
  
  validates :name, presence: true, length: {minimum: 5}
  validates :price, presence: true, numericality: true
end
