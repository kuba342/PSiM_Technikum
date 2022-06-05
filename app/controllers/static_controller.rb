class StaticController < ApplicationController
  before_action :require_token, only: [:feed]

  def index
    @animal_types = AnimalType.all
    @animals = Animal.all
  end

  def feed
    @animal_types = AnimalType.all
    @animals = Animal.all
  end
end
