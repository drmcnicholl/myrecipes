require 'test_helper'

class ChefTest <ActiveSupport::TestCase
  
  def setup
   @chef = Chef.new(chefname:"john", email: "john@example.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname not too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname not too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid? 
  end
  
  test "email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email not too long" do
    @chef.email = "a" * 100
    assert_not @chef.valid?
  end
  
  test "email not too short" do
    @chef.email = "a" * 9
    assert_not @chef.valid? 
  end
  
end