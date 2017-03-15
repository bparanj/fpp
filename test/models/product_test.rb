require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "search product" do
    api_response = file_fixture('results.json').read
    data = JSON.parse(api_response)
    
    Search.stub :where, nil do
      mock = MiniTest::Mock.new
      mock.expect(:products_field, [], ['search', 'iphone'])
      mock.expect(:get_products, data)
      mock.expect(:call, data)

      stub_sem = Proc.new do
        mock
      end
      
      Semantics3::Products.stub :new, stub_sem do
        result = Product.search('iphone')

        refute result.nil?
      end    
    end
  end  
end
