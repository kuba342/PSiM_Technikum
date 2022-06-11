class TestsController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :tests, 'Tests'

  before_action :set_test, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  swagger_api :index do
    summary 'Returns all tests'
    notes 'Each object from database'
  end
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  swagger_api :show do
    summary 'Returns concrete test'
    param :path, :id, :integer, :required, "Test id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /tests/new
  swagger_api :new do
    summary 'Returns html form to create new test'
  end
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit test by id'
    param :path, :id, :integer, :required, "test id"
  end
  def edit
  end

  # POST /tests or /tests.json
  swagger_api :create do
    summary 'Create a test'
    param :form, "test[name]", :string, :required, "name of the test"
    param :form, "test[description]", :text, :required, "description"
  end
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  swagger_api :update do
    summary 'Update a test'
    param :path, :id, :integer, :required, "test id"
    param :form, "test[name]", :string, :required, "name of the test"
    param :form, "test[description]", :text, :required, "description"
  end
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  swagger_api :destroy do
    summary 'Destroys concrete test by id'
    param :path, :id, :integer, :required, "test id"
  end
  def destroy
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:name, :description)
    end
end
