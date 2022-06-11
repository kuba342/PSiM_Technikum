class ClassroomsController < ApplicationController
  skip_before_action :verify_authenticity_token
  swagger_controller :classrooms, 'Classrooms'

  before_action :set_classroom, only: %i[ show edit update destroy ]

  # GET /classrooms or /classrooms.json
  swagger_api :index do
    summary 'Returns all classrooms'
    notes 'Each object from database'
  end
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1 or /classrooms/1.json
  swagger_api :show do
    summary 'Returns concrete classroom'
    param :path, :id, :integer, :required, "classroom id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /classrooms/new
  swagger_api :new do
    summary 'Returns html form to create new classroom'
  end
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit classroom by id'
    param :path, :id, :integer, :required, "classroom id"
  end
  def edit
  end

  # POST /classrooms or /classrooms.json
  swagger_api :create do
    summary 'Create a classroom'
    param :form, "classroom[number]", :integer, :required, "number of classroom"
  end
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classroom_url(@classroom), notice: "Classroom was successfully created." }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1 or /classrooms/1.json
  swagger_api :update do
    summary 'Update a classroom'
    param :path, :id, :integer, :required, "classroom id"
    param :form, "classroom[number]", :number, :required, "number of classroom"
  end
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to classroom_url(@classroom), notice: "Classroom was successfully updated." }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1 or /classrooms/1.json
  swagger_api :destroy do
    summary 'Destroys concrete classroom by id'
    param :path, :id, :integer, :required, "classroom id"
  end
  def destroy
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: "Classroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classroom_params
      params.require(:classroom).permit(:number)
    end
end
