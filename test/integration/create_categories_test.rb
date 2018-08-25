require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    #going to new category path 
    assert_template 'categories/new'
    #getting new form 
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
      #posting to new form and creating this category sports 
    end
    assert_template 'categories/index'
    #which is redirected to index page
    assert_match "sports", response.body
    #now it should have sports because it is created in page
  end
  
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
      #just post since we are not redirecting here
    end
    assert_template 'categories/new'
    assert_select "h2.panel-title"
    assert_select "div.panel-body"
    #referencing existence of errors in error.html.erb
  end
  
  
end