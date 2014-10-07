require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do
	describe 'GET index' do		
	    it 'assigns @students' do
	    	students = Student.all
	      	get :index
	      	expect(assigns(:students)).to eq(students)
	    end

	    it 'renders the index template' do
	    	get :index
	      	expect(response).to render_template('index')
	    end
  	end

  	describe 'GET show' do		
	    it 'assigns @student' do
	    	student = Student.first
	      	get :show, id: student
	      	expect(assigns(:student)).to eq(student)
	    end

	    it 'renders the show template' do
	    	get :show, id: Student.first
	      	expect(response).to render_template('show')
	    end
  	end

  	describe 'GET new' do		
	    it 'assigns @student' do
	    	student = Student.new
	      	get :new
	      	expect(assigns(:student).attributes).to eq(student.attributes)
	    end

	    it 'renders the new template' do
	    	get :new
	      	expect(response).to render_template('new')
	    end
  	end
end

# Integration Tests
RSpec.describe 'new and create', :type => :request do
	context 'when valid params' do
		it 'saves new student' do
			student = Student.create!(:name => 'jdoe')
    		get 'students/new'
    		assert_select 'form' do
      			assert_select 'input[name=?]', 'student[name]'
      			assert_select 'input[type=?]', 'submit'
      		end
      		expect{ post '/students', student: student.attributes }.to change(Student, :count).by(1)
    	end    	
	end
end