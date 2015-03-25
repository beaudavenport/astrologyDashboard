class Event < ActiveRecord::Base
  
  include HTML_Sanitize
    
  before_save do
    self.description = sanitize(self.description)
  end
end
