class StudentsController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :students, 'Students'

  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  swagger_api :index do
    summary 'Returns all Students'
    notes 'Each object from database'
  end
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  swagger_api :show do
    summary 'Returns concrete student'
    param :path, :id, :integer, :required, "Student id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /students/new
  swagger_api :new do
    summary 'Returns html form to create new student'
  end
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit student by id'
    param :path, :id, :integer, :required, "student id"
  end
  def edit
  end

  # POST /students or /students.json
  swagger_api :create do
    summary 'Create a student'
    param :form, "student[firstName]", :string, :required, "student's first name"
    param :form, "student[lastName]", :string, :required, "student's last name"
    param :form, "student[class_of_student_id]", :integer, :required, "class of students id"
    param :form, "student[user_id]", :integer, :required, "User id"
  end
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  swagger_api :update do
    summary 'Update a student'
    param :path, :id, :integer, :required, "student id"
    param :form, "student[firstName]", :string, :required, "student's first name"
    param :form, "student[lastName]", :string, :required, "student's last name"
    param :form, "student[class_of_student_id]", :integer, :required, "class of students id"
    param :form, "student[user_id]", :integer, :required, "User id"
  end
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  swagger_api :destroy do
    summary 'Destroys concrete student by id'
    param :path, :id, :integer, :required, "student id"
  end
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:firstName, :lastName, :user_id, :class_of_student_id)
    end
end
