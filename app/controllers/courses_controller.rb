class CoursesController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :courses, 'Courses'

  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  swagger_api :index do
    summary 'Returns all courses'
    notes 'Each object from database'
  end
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  swagger_api :show do
    summary 'Returns concrete course'
    param :path, :id, :integer, :required, "course id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /courses/new
  swagger_api :new do
    summary 'Returns html form to create new course'
  end
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit course by id'
    param :path, :id, :integer, :required, "course id"
  end
  def edit
  end

  # POST /courses or /courses.json
  swagger_api :create do
    summary 'Create a course'
    param :form, "course[name]", :string, :required, "name of the course"
  end
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  swagger_api :update do
    summary 'Update a course'
    param :path, :id, :integer, :required, "course id"
    param :form, "course[name]", :string, :required, "name of the course"
  end
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  swagger_api :destroy do
    summary 'Destroys concrete course by id'
    param :path, :id, :integer, :required, "course id"
  end
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name)
    end
end
