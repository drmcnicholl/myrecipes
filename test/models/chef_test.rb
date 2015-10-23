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
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email not too long" do
    @chef.email = "c" * 101
    assert_not @chef.valid?
  end

  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email should be valid" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com df30@cam.ac.uk laura+joe@honk.eu]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
      
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@dhy,com haiku!lose.org ohmy.com whynot@mail.]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
  
end