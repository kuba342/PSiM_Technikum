class LessonsController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :lessons, 'Lessons'

  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  swagger_api :index do
    summary 'Returns all lessons'
    notes 'Each object from database'
  end
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  swagger_api :show do
    summary 'Returns concrete lesson'
    param :path, :id, :integer, :required, "lesson id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /lessons/new
  swagger_api :new do
    summary 'Returns html form to create new lesson'
  end
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit lesson by id'
    param :path, :id, :integer, :required, "lesson id"
  end
  def edit
  end

  # POST /lessons or /lessons.json
  swagger_api :create do
    summary 'Create a lesson'
    param :form, "lesson[date]", :datetime, :required, "lesson date"
    param :form, "lesson[course_id]", :integer, :required, "course id"
    param :form, "lesson[test_id]", :integer, :required, "test id"
    param :form, "lesson[class_of_student_id]", :integer, :required, "class of students id"
    param :form, "lesson[teacher_id]", :integer, :required, "teacher id"
    param :form, "lesson[animal_id]", :integer, :required, "animal id"
    param :form, "lesson[classroom_id]", :integer, :required, "classroom id"
  end
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  swagger_api :update do
    summary 'Update a lesson'
    param :path, :id, :integer, :required, "lesson id"
    param :form, "lesson[date]", :datetime, :required, "lesson date"
    param :form, "lesson[course_id]", :integer, :required, "course id"
    param :form, "lesson[test_id]", :integer, :required, "test id"
    param :form, "lesson[class_of_student_id]", :integer, :required, "class of students id"
    param :form, "lesson[teacher_id]", :integer, :required, "teacher id"
    param :form, "lesson[animal_id]", :integer, :required, "animal id"
    param :form, "lesson[classroom_id]", :integer, :required, "classroom id"
  end
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  swagger_api :destroy do
    summary 'Destroys concrete lesson by id'
    param :path, :id, :integer, :required, "lesson id"
  end
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:date, :teacher_id, :class_of_student_id, :animal_id, :test_id, :classroom_id, :course_id)
    end
end
