class StudentsController < ApplicationController

    def index
        students = Student.all 
        render json: students
    end

    def show
        student = find_student
        render json: student, status: :ok 
        end
    
    def create 
        student = Student.create!(student_params)
        render json: student, status: :created
    end
    
    def update 
        student = Student.update!(student_params)
        render json: student, status: :updated 
    end
    
    def destroy
        student = find_student
        student.destroy 
        head :no_content
    end


    private 

    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

end
