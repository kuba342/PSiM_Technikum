class AnimalsController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :animals, 'Animals'

  before_action :set_animal, only: %i[ show edit update destroy ]

  # GET /animals or /animals.json
  swagger_api :index do
    summary 'Returns all animals'
    notes 'Each object from database'
  end
  def index
    @animals = Animal.all
  end

  # GET /animals/1 or /animals/1.json
  swagger_api :show do
    summary 'Returns concrete animal'
    param :path, :id, :integer, :required, "Animal id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /animals/new
  swagger_api :new do
    summary 'Returns html form to create new animal'
  end
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit animal by id'
    param :path, :id, :integer, :required, "animal id"
  end
  def edit
  end

  # POST /animals or /animals.json
  swagger_api :create do
    summary 'Create an animal'
    param :form, "animal[code]", :string, :required, "animal code"
    param :form, "animal[animal_type_id]", :integer, :required, "animal type id"
  end
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animal_url(@animal), notice: "Animal was successfully created." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  swagger_api :update do
    summary 'Update an animal'
    param :path, :id, :integer, :required, "animal id"
    param :form, "animal[code]", :string, :required, "animal code"
    param :form, "animal[animal_type_id]", :integer, :required, "animal type id"
  end
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animal_url(@animal), notice: "Animal was successfully updated." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1 or /animals/1.json
  swagger_api :destroy do
    summary 'Destroys concrete animal by id'
    param :path, :id, :integer, :required, "animal id"
  end
  def destroy
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url, notice: "Animal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:code, :animal_type_id)
    end
end
