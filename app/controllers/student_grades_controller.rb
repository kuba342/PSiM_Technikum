class StudentGradesController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :student_grades, 'student grades'

  before_action :set_student_grade, only: %i[ show edit update destroy ]

  # GET /student_grades or /student_grades.json
  swagger_api :index do
    summary 'Returns all student grades'
    notes 'Each object from database'
  end
  def index
    @student_grades = StudentGrade.all
  end

  # GET /student_grades/1 or /student_grades/1.json
  swagger_api :show do
    summary 'Returns concrete grade'
    param :path, :id, :integer, :required, "student grade id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /student_grades/new
  swagger_api :new do
    summary 'Returns html form to create new student grade'
  end
  def new
    @student_grade = StudentGrade.new
  end

  # GET /student_grades/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit grade by id'
    param :path, :id, :integer, :required, "student grade id"
  end
  def edit
  end

  # POST /student_grades or /student_grades.json
  swagger_api :create do
    summary 'Create a student grade'
    param :form, "student_grade[date]", :datetime, :required, "date"
    param :form, "student_grade[grade]", :float, :required, "grade"
    param :form, "student_grade[student_id]", :integer, :required, "student id"
    param :form, "student_grade[test_id]", :integer, :required, "test id"
    param :form, "student_grade[course_id]", :integer, :required, "course id"
    param :form, "student_grade[teacher_id]", :integer, :required, "teacher id"
  end
  def create
    @student_grade = StudentGrade.new(student_grade_params)

    respond_to do |format|
      if @student_grade.save
        format.html { redirect_to student_grade_url(@student_grade), notice: "Student grade was successfully created." }
        format.json { render :show, status: :created, location: @student_grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_grades/1 or /student_grades/1.json
  swagger_api :update do
    summary 'Update a student grade'
    param :path, :id, :integer, :required, "student grade id"
    param :form, "student_grade[date]", :datetime, :required, "date"
    param :form, "student_grade[grade]", :float, :required, "grade"
    param :form, "student_grade[student_id]", :integer, :required, "student id"
    param :form, "student_grade[test_id]", :integer, :required, "test id"
    param :form, "student_grade[course_id]", :integer, :required, "course id"
    param :form, "student_grade[teacher_id]", :integer, :required, "teacher id"
  end
  def update
    respond_to do |format|
      if @student_grade.update(student_grade_params)
        format.html { redirect_to student_grade_url(@student_grade), notice: "Student grade was successfully updated." }
        format.json { render :show, status: :ok, location: @student_grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_grades/1 or /student_grades/1.json
  swagger_api :destroy do
    summary 'Destroys concrete grade by id'
    param :path, :id, :integer, :required, "grade id"
  end
  def destroy
    @student_grade.destroy

    respond_to do |format|
      format.html { redirect_to student_grades_url, notice: "Student grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_grade
      @student_grade = StudentGrade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_grade_params
      params.require(:student_grade).permit(:grade, :date, :teacher_id, :student_id, :course_id, :test_id)
    end
end
