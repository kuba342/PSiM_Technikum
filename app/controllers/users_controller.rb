class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :users, 'Users'

  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  swagger_api :index do
    summary 'Returns all users'
    notes 'Each object from database'
  end
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  swagger_api :show do
    summary 'Returns concrete user'
    param :path, :id, :integer, :required, "user id"
    notes 'Returns by id'
  end
  def show
  end

  # GET /users/new
  swagger_api :new do
    summary 'Returns html form to create new user'
  end
  def new
    @user = User.new
  end

  # GET /users/1/edit
  swagger_api :edit do
    summary 'Returns html form to edit user by id'
    param :path, :id, :integer, :required, "user id"
  end
  def edit
  end

  # POST /users or /users.json
  swagger_api :create do
    summary 'Create a user'
    param :form, "user[login]", :string, :required, "User login"
    param :form, "user[email]", :string, :required, "User email"
    param :form, "user[password]", :string, :required, "User password"
    param :form, "user[password_confirmation]", :string, :required, "User password_confirmation"
  end
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  swagger_api :update do
    summary 'Update a user'
    param :path, :id, :integer, :required, "user id"
    param :form, "user[login]", :string, :required, "User login"
    param :form, "user[email]", :string, :required, "User email"
    param :form, "user[password]", :string, :required, "User password"
    param :form, "user[password_confirmation]", :string, :required, "User password_confirmation"
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  swagger_api :destroy do
    summary 'Destroys concrete user by id'
    param :path, :id, :integer, :required, "user id"
  end
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :email, :password, :password_confirmation)
    end
end
