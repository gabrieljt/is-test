require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do	
	describe "GET index" do		
	    it "assigns @courses" do
	    	courses = Course.all
	      	get :index
	      	expect(assigns(:courses)).to eq(courses)
	    end

	    it "renders the index template" do
	    	get :index
	      	expect(response).to render_template("index")
	    end
  	end
end