require 'test_helper'
# must require for all test files 

class CategoryTest < ActiveSupport::TestCase
  
  def setup
  #this method runs before every single test
    @category = Category.new(name: "sports")
    # this will not hit development database, just test database, all automated
  
  end
  
  test "category should be valid" do
    # we are going to user an assertion here
    assert @category.valid?
    
  end
  
  test "name should be present" do 
    @category.name = " "
    # to test negative assertion we say:
    assert_not @category.valid?
    # if this is not valid this test will pass
  end
  
  test "name should be unique" do
    #categories cant have the same name 
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
    # should not have the same name sports
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    # this should fail because it is creating a string of 26 chars
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = 'aa'
    assert_not @category.valid?
  end
  
end