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

  	describe "GET new" do		
	    it "assigns @course, @statuses" do
	    	course = Course.new
	    	statuses = Course.statuses
	      	get :new
	      	expect(assigns(:course).attributes).to eq(course.attributes)
	      	expect(assigns(:statuses)).to eq(statuses)
	    end

	    it "renders the new template" do
	    	get :new
	      	expect(response).to render_template("new")
	    end
  	end
end