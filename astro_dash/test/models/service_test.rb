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
  test "model should only save if description present and free from harmful characters" do
    
    
  end
  
end
