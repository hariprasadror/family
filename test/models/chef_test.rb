require 'test_helper'

class ChefTest <ActiveSupport::TestCase

def setup
 
  @chef = Chef.new(chefname: "hari",email: "velpulahari@gmail.com")

end

test " chef should be valid "   do

	assert @chef.valid?
	
end

test "chef should name should be presence" do
	@chef.chefname = ""
    assert_not @chef.valid?
end

test "chef should not be too long" do

	@chef.chefname = "a" * 41
	assert_not @chef.valid?

end


test "chef should not be too short" do

	@chef.chefname = "aa"
	assert_not @chef.valid?
end

test "email should be present" do
   @chef.email = ""
   assert_not @chef.valid?
end

test "email should be with in the bounds" do

	@chef.email = "a" * 101 + "@example.com"
	assert_not @chef.valid?
end

test "email should be unique" do
	dup_chef = @chef.dup
	dup_chef.email = @chef.email.upcase
	@chef.save
	assert_not dup_chef.valid?
end

test "email validation accept valid adress" do

valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org  user@example.com fast.last@eem.au laura+joe@monk.cm]
valid_addresses.each do |va|
	@chef.email = va
	assert_not @chef.valid?, '#{va.inspect}'
end
end

test "email validation shoul reject invalid adress" do
	invalid_addresses = %w[user@example,com user_at_email.org  user@name.  eee@i_am.comss foo@eee+aar.com]
	invalid_addresses.each do |va|
		@chef.email =  va
    assert_not @chef.valid?,  '#{va.inspect}'
end
end



end
