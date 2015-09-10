class PagesController < ApplicationController

def home
redirect_to recipe_path if log_in?
end


end
