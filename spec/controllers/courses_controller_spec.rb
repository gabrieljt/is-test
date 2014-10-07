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

  	describe "GET show" do		
	    it "assigns @course" do
	    	course = Course.first
	      	get :show, id: course
	      	expect(assigns(:course)).to eq(course)
	    end

	    it "renders the show template" do
	    	get :show, id: Course.first
	      	expect(response).to render_template("show")
	    end
  	end
end