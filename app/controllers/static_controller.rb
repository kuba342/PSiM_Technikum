class StaticController < ApplicationController

  skip_before_action :verify_authenticity_token
  swagger_controller :static, 'Static'

  before_action :require_token, only: [:feed]

  swagger_api :index do
    summary 'Returns all animal types and animals'
    notes 'Each object from database'
  end
  def index
    @animal_types = AnimalType.all
    @animals = Animal.all
  end

  swagger_api :feed do
    summary 'Returns all animal types and animals'
    param :header, "Authorization", :string, :required, "Authentication token"
    notes 'Each object from database'
  end
  def feed
    @animal_types = AnimalType.all
    @animals = Animal.all
  end
end
