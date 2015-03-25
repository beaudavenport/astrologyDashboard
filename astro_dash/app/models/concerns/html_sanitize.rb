# HTML Sanitizer
module HTML_Sanitize 
  extend ActiveSupport::Concern
  
  require 'sanitize'
  
  # sanitize HTML input using white list array of allowable HTML tags in config variables
  def sanitize(input) 
    Sanitize.fragment(input, 
      :elements => APP_CONFIG['HTML_white_list']['elements'],
      :attributes => {
        :all => APP_CONFIG['HTML_white_list']['attributes']
      })
  end
  
end
