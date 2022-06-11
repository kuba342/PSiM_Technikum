class ClassOfStudentsController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :class_of_students, 'Class of students'

  before_action :set_class_of_student, only: %i[ show edit update destroy ]

  # GET /class_of_students or /class_of_students.json
  swagger_api :index do
    summary 'Returns all classes of students'
    notes 'Each object from database'
  end
  def index
    @class_of_students = ClassOfStudent.all
  end

  # GET /class_of_students/1 or /class_of_students/1.json
  swagger_api :show do
    summary 'Returns concrete class of students'
    param :path, :id, :integer, :required, "class of students id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /class_of_students/new
  swagger_api :new do
    summary 'Returns html form to create new class of students'
  end
  def new
    @class_of_student = ClassOfStudent.new
  end

  # GET /class_of_students/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit class of students by id'
    param :path, :id, :integer, :required, "class of students id"
  end
  def edit
  end

  # POST /class_of_students or /class_of_students.json
  swagger_api :create do
    summary 'Create a class of students'
    param :form, "class_of_student[symbol]", :string, :required, "class symbol"
    param :form, "class_of_student[yearOfStart]", :integer, :required, "class year of education start"
    param :form, "class_of_student[teacher_id]", :integer, :required, "supervising teacher"
  end
  def create
    @class_of_student = ClassOfStudent.new(class_of_student_params)

    respond_to do |format|
      if @class_of_student.save
        format.html { redirect_to class_of_student_url(@class_of_student), notice: "Class of student was successfully created." }
        format.json { render :show, status: :created, location: @class_of_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_of_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_of_students/1 or /class_of_students/1.json
  swagger_api :update do
    summary 'Update a class of students'
    param :path, :id, :integer, :required, "class od students id"
    param :form, "class_of_student[symbol]", :string, :required, "class symbol"
    param :form, "class_of_student[yearOfStart]", :integer, :required, "class year of education start"
    param :form, "class_of_student[teacher_id]", :integer, :required, "supervising teacher"
  end
  def update
    respond_to do |format|
      if @class_of_student.update(class_of_student_params)
        format.html { redirect_to class_of_student_url(@class_of_student), notice: "Class of student was successfully updated." }
        format.json { render :show, status: :ok, location: @class_of_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_of_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_of_students/1 or /class_of_students/1.json
  swagger_api :destroy do
    summary 'Destroys concrete class of students by id'
    param :path, :id, :integer, :required, "class of students id"
  end
  def destroy
    @class_of_student.destroy

    respond_to do |format|
      format.html { redirect_to class_of_students_url, notice: "Class of student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_of_student
      @class_of_student = ClassOfStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_of_student_params
      params.require(:class_of_student).permit(:symbol, :yearOfStart, :teacher_id)
    end
end
