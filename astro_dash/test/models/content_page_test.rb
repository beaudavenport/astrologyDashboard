require 'test_helper'

class ContentPageTest < ActiveSupport::TestCase
  
  test "FixturesPresent" do
    assert_not ContentPage.nil
    assert_equal 3, ContentPage.count
  end

end
