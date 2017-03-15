require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "search product" do
    api_response = file_fixture('results.json').read
    data = JSON.parse(api_response)
    
    assert_equal 10, data['results_count']
        
    assert_equal "679.99", data['results'][0]['price']
    assert_equal "Gold", data['results'][0]['color']
    assert_equal 'Apple', data['results'][0]['manufacturer']
    assert_equal "Iphone", data['results'][0]['brand']    
  end
end

