class ContentPage < ActiveRecord::Base
  
  include HTML_Sanitize
    
  before_save do
    self.body = sanitize(self.body)
  end
  
end
