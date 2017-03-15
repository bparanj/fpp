require 'ostruct'

class Product  
  def self.search(term)
    search = Search.where(term: 'iphone')
    
    if search.nil?
      sem3 = Semantics3::Products.new(API_KEY, API_SECRET)
      sem3.products_field("search", term)
      data = sem3.get_products
      
      Search.create(term: term, results: data)  
    else
      data = search.first.results
    end  
    
    rows(data)  
  end
  
  private
  
  def self.rows(data)
    products = []
    
    results_count = data['results_count']
    for i in 0..(results_count - 1)
      record = data['results'][i]
      product = OpenStruct.new(:price => record['price'], 
                               :manufacturer => record['manufacturer'], 
                               :color => record['color'], 
                               :brand => record['brand'])
      products << product
    end
    products            
  end
    
end

