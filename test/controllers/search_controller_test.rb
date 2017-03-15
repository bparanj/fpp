require 'minitest/autorun'
require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_url
    
    assert_response :success
  end

  test 'should delegate search to Product class' do
    mock = MiniTest::Mock.new
    mock.expect(:call, [], ['iphone'])
    Product.stub(:search, mock) do
      get search_url, params: { q: "iphone" }  
    end
    mock.verify    
  end
end