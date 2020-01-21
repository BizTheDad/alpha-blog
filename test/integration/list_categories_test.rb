require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @sports_category = Category.create(name: "sports")
    @programming_category = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select 'a[href=?]', category_path(@sports_category), text: @sports_category.name
    assert_select 'a[href=?]', category_path(@programming_category), text: @programming_category.name
  end

end
