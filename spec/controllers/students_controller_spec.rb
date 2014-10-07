require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do
	describe "GET index" do		
	    it "assigns @students" do
	    	students = Student.all
	      	get :index
	      	expect(assigns(:students)).to eq(students)
	    end

	    it "renders the index template" do
	    	get :index
	      	expect(response).to render_template("index")
	    end
  	end
end
