class PresencesController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :presences, 'Presences'

  before_action :set_presence, only: %i[ show edit update destroy ]

  # GET /presences or /presences.json
  swagger_api :index do
    summary 'Returns all presences'
    notes 'Each object from database'
  end
  def index
    @presences = Presence.all
  end

  # GET /presences/1 or /presences/1.json
  swagger_api :show do
    summary 'Returns concrete presence'
    param :path, :id, :integer, :required, "Presence id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /presences/new
  swagger_api :new do
    summary 'Returns html form to create new presence'
  end
  def new
    @presence = Presence.new
  end

  # GET /presences/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit presence by id'
    param :path, :id, :integer, :required, "presence id"
  end
  def edit
  end

  # POST /presences or /presences.json
  swagger_api :create do
    summary 'Create a presence'
    param :form, "presence[isPresent]", :boolean, :required, "is present?"
    param :form, "presence[lesson_id]", :integer, :required, "lesson id"
    param :form, "presence[student]", :integer, :required, "student id"
  end
  def create
    @presence = Presence.new(presence_params)

    respond_to do |format|
      if @presence.save
        format.html { redirect_to presence_url(@presence), notice: "Presence was successfully created." }
        format.json { render :show, status: :created, location: @presence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presences/1 or /presences/1.json
  swagger_api :update do
    summary 'Update a presence'
    param :path, :id, :integer, :required, "presence id"
    param :form, "presence[isPresent]", :boolean, :required, "is present?"
    param :form, "presence[lesson_id]", :integer, :required, "lesson id"
    param :form, "presence[student]", :integer, :required, "student id"
  end
  def update
    respond_to do |format|
      if @presence.update(presence_params)
        format.html { redirect_to presence_url(@presence), notice: "Presence was successfully updated." }
        format.json { render :show, status: :ok, location: @presence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presences/1 or /presences/1.json
  swagger_api :destroy do
    summary 'Destroys concrete presence by id'
    param :path, :id, :integer, :required, "presence id"
  end
  def destroy
    @presence.destroy

    respond_to do |format|
      format.html { redirect_to presences_url, notice: "Presence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presence_params
      params.require(:presence).permit(:isPresent, :student_id, :lesson_id)
    end
end
