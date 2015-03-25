require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  
  # Test title validation
  test "service should only save if price is present and a float" do
    
    bad_service = Service.new(name: "Bad Price Service", description: "Wrong price", price: "orange")
    bad_service2 = Service.new(name: "Bad Price Service 2", description: "No price")
    
    assert_not bad_service.save, "Saved service price in a non-float format"
    assert_not bad_service.save, "Saved service without a price given"
    
    good_service = Service.new(name: "Good price service", description: "A good service description", price: 1.99)
    assert good_service.save, "Didn't save service despite correct price"
    
  end
  
  # Test price validation
  test "model should only save if name is present and at least 5 characters long" do
    
    bad_service = Service.new(name: "bad", description: "name too short", price: 1.99)
    bad_service2 = Service.new(description: "no name", price: 1.99)
    
    assert_not bad_service.save, "Saved service with name less than 5 characters long"
    assert_not bad_service2.save, "Saved service with no name given"
    
    good_service = Service.new(name: "Good service title", description: "A good service title", price: 1.99)
    assert good_service.save, "Didn't save service despite correct title"
    
  end
  
  # Test description validation
  test "model should only save description with white-listed tags" do
    
    raw_description = "<font size='7'>Big</font><font face='serif'></font>"
    raw_input = Service.new(name: "raw_html_input", description: raw_description, price: 1.99)
    raw_input.save
    new_model = Service.last
    sanitized_description = new_model.description
    assert_not_equal raw_description, sanitized_description, "HTML white list ignored"
    assert_equal "Hello<b>Raw Input</b>", sanitized_description, "HTML white list not working as expected"
  end
  
  # Test required info validation
  test "model should only save required info with white-listed tags" do
    
    raw_info = "<font size='7'>Address</font><font face='serif'></font>"
    raw_input = Service.new(name: "raw_html_input", required_info: raw_info, price: 1.99)
    raw_input.save
    new_model = Service.last
    sanitized_info = new_model.required_info
    assert_not_equal raw_info, sanitized_info, "HTML white list ignored"
    assert_equal "Hello<b>Raw Input</b>", sanitized_info, "HTML white list not working as expected"
  end
  
end
