class TeachersController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :teachers, 'Teachers'

  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  swagger_api :index do
    summary 'Returns all teachers'
    notes 'Each object from database'
  end
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  swagger_api :show do
    summary 'Returns concrete teacher'
    param :path, :id, :integer, :required, "Teacher id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /teachers/new
  swagger_api :new do
    summary 'Returns html form to create new teacher'
  end
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit teacher by id'
    param :path, :id, :integer, :required, "animal id"
  end
  def edit
  end

  # POST /teachers or /teachers.json
  swagger_api :create do
    summary 'Create a teacher'
    param :form, "teacher[firstName]", :string, :required, "teacher's first name"
    param :form, "teacher[lastName]", :string, :required, "teacher's last name"
    param :form, "teacher[user_id]", :integer, :required, "User id"
  end
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  swagger_api :update do
    summary 'Update a teacher'
    param :path, :id, :integer, :required, "teacher id"
    param :form, "teacher[firstName]", :string, :required, "teacher's first name"
    param :form, "teacher[lastName]", :string, :required, "teacher's last name"
    param :form, "teacher[user_id]", :integer, :required, "User id"
  end
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  swagger_api :destroy do
    summary 'Destroys concrete teacher by id'
    param :path, :id, :integer, :required, "teacher id"
  end
  def destroy
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:firstName, :lastName, :user_id)
    end
end
