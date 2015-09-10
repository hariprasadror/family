require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

def setup
@chef = Chef.create(chefname: "bob", email: "bob@xample.com")
@recipe = @chef.recipes.build(name: "chicken farm", summary: "this is chef sumary", description: "heat oil, add onions ,fry")
end

test "recipe should be valid"   do 
 assert @recipe.valid?
end
	
test 'chef_id should be present' do

	@recipe.chef_id = nil
	assert_not @recipe.valid?

end


test "name should be vaild " do

 @recipe.name = ""
 assert_not @recipe.valid?
end


test "name should be not be too long" do
@recipe.name = "a"*101
assert_not @recipe.valid?
end

test "name should be not be too short" do

	@recipe.name = "aaaa"
    assert_not @recipe.valid?

end

test "summary should be present" do

	@recipe.summary = ""
 assert_not @recipe.valid?

end

test "summary should not be too long " do

	@recipe.summary = "a" * 151
   assert_not @recipe.valid?
end


test "summary should not be too short" do
  
  @recipe.summary = "a" * 9
 assert_not @recipe.valid?
end

test "description should not be too long" do

	@recipe.description = "a" *501
    assert_not @recipe.valid?
end


test "description should not be too short" do
	@recipe.description = "a" * 9
    assert_not @recipe.valid?
end

end