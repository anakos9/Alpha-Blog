require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
 
  def setup 
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end
  
  test "should show categories lsiting" do
    get categories_path
    assert_template "categories/index"
    assert_select "a[href=?]", category_path(@category), text: @category.name
    # we do this to ensure link (href) the link it to category_path says the category name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
  
end