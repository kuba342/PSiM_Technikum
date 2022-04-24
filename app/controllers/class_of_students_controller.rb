class ClassOfStudentsController < ApplicationController
  before_action :set_class_of_student, only: %i[ show edit update destroy ]

  # GET /class_of_students or /class_of_students.json
  def index
    @class_of_students = ClassOfStudent.all
  end

  # GET /class_of_students/1 or /class_of_students/1.json
  def show
  end

  # GET /class_of_students/new
  def new
    @class_of_student = ClassOfStudent.new
  end

  # GET /class_of_students/1/edit
  def edit
  end

  # POST /class_of_students or /class_of_students.json
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
      params.require(:class_of_student).permit(:symbol, :yearOfStart)
    end
end
