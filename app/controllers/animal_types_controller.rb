class AnimalTypesController < ApplicationController
  skip_before_action :verify_authenticity_token
  #To trzeba dodać do każdego kontrolera
  swagger_controller :animal_types, 'Animal Types'

  before_action :set_animal_type, only: %i[ show edit update destroy ]

  # GET /animal_types or /animal_types.json
  swagger_api :index do
    summary 'Returns all animal types'
    notes 'Each object from database'
  end
  def index
    @animal_types = AnimalType.all
  end

  # GET /animal_types/1 or /animal_types/1.json
  swagger_api :show do
    summary 'Returns concrete animal type'
    param :path, :id, :integer, :required, "AnimalType id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /animal_types/new
  swagger_api :new do
    summary 'Returns html form to create new animal type'
  end
  def new
    @animal_type = AnimalType.new
  end

  # GET /animal_types/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit animal type by id'
    param :path, :id, :integer, :required, "animal_type id"
  end
  def edit
  end

  # POST /animal_types or /animal_types.json
  swagger_api :create do
    summary 'Create an animal type'
    param :form, "animal_type[group]", :string, :required, "group of type"
    param :form, "animal_type[species]", :string, :required, "species of animal"
  end
  def create
    @animal_type = AnimalType.new(animal_type_params)

    respond_to do |format|
      if @animal_type.save
        format.html { redirect_to animal_type_url(@animal_type), notice: "Animal type was successfully created." }
        format.json { render :show, status: :created, location: @animal_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_types/1 or /animal_types/1.json
  swagger_api :update do
    summary 'Update an animal type'
    param :path, :id, :integer, :required, "animal_type id"
    param :form, "animal_type[group]", :string, :required, "group of type"
    param :form, "animal_type[species]", :string, :required, "species of animal"
  end
  def update
    respond_to do |format|
      if @animal_type.update(animal_type_params)
        format.html { redirect_to animal_type_url(@animal_type), notice: "Animal type was successfully updated." }
        format.json { render :show, status: :ok, location: @animal_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_types/1 or /animal_types/1.json
  swagger_api :destroy do
    summary 'Destroys concrete animal type by id'
    param :path, :id, :integer, :required, "animal_type id"
  end
  def destroy
    @animal_type.destroy

    respond_to do |format|
      format.html { redirect_to animal_types_url, notice: "Animal type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_type
      @animal_type = AnimalType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_type_params
      params.require(:animal_type).permit(:species, :group)
    end
end
