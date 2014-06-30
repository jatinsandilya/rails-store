require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	#get the data from the fixtures into this 'product' class variable
  end
  def new_product options = {}
  	Product.new(
  		title:options[:title]||'title',
  		description:options[:description]||'yyyy',
  		image_url:options[:image_url]||'xyz.jpg',
  		price:options[:price]||4.00)
  end


  test "fields should not be empty" do
  	   
  	   prod = Product.new
  	   assert !prod.save,'Product is empty...' 
  end
  
  test "image must be a jpg,png or gif" do
	   #setting the image format to any invalid one
	   FORMATS_GOOD	 = %w{ jatin.gif jatin.jpg jatin.png jatin.JPG jatin.Jpg 
	   	http://a.b.c/x/y/z/jatin.gif }
       
       FORMATS_BAD = %w{ jatin.doc jatin.gif/more jatin.gif.more } 

	   FORMATS_GOOD.each do |f|	 
	   prod = new_product image_url:f
       assert prod.valid?,"image_url #{f} not valid !"
       
       FORMATS_BAD.each do |f|
       	prod = new_product image_url:f
       	assert prod.invalid?,"image_url #{f} is valid !"
       end


     end
  
  end

  test "price must be numeric and above 0.01" do
	  	#setting the price to any invalid value
	  	prod = new_product price:2.00
	  	assert_equal prod.title,'title','not matching'
	  	assert prod.save,'price not valid!'

  end
	  
  test "Title should be unique" do
	  	prod_one = new_product

        prod_two = new_product

	  	assert prod_one.save,'One title saved in db'
	  	assert !prod_two.save,'title not unique!'
  end
  
  

end
