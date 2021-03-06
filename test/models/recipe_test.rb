require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname:"bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name:"chicken parm", summary:"this is the best parm",
              description:"cook it. eat.it will be delicious")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "check valid chef_id" do
    @recipe.chef_id = nil
    assert_not @recipe.valid? 
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name should not be too short" do
    @recipe.name = "b" * 4
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary should not be too long" do
    @recipe.summary = "c" * 151
    assert_not @recipe.valid?
  end
  
  test "summary should not be too short" do
    @recipe.summary = "d" * 9
    assert_not @recipe.valid?  
  end

  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?  
  end
  
  test "description should not be too long" do
    @recipe.description = "e" * 501
    assert_not @recipe.valid?
  end
  
  test "description should not be too short" do
    @recipe.description = "f" * 19
    assert_not @recipe.valid?  
  end
  
end
